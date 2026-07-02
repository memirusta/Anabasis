import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:anabasis/theme_notifier.dart';
import 'package:anabasis/about_page.dart';
import 'package:anabasis/sidebar_navigation.dart';
import 'package:anabasis/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class MapNavigationButton extends StatelessWidget {
  final double originLatitude;
  final double originLongitude;
  final double destinationLatitude;
  final double destinationLongitude;
  final Function() onDirectionsRequested;

  const MapNavigationButton({Key? key,
    required this.originLatitude,
    required this.originLongitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.onDirectionsRequested,
  }) : super(key: key);

  void launchMapsUrl() async {
    final Uri url =
        Uri.parse('https://www.google.com/maps/dir/?api=1&origin=$originLatitude,$originLongitude&destination=$destinationLatitude,$destinationLongitude&travelmode=driving');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onDirectionsRequested();
        launchMapsUrl();
      },
      child: Text(AppLocalizations.of(context)!.yoltarifbuton, selectionColor: Provider.of<ThemeNotifier>(context, listen: false).primaryColor,),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            locale: context.watch<ThemeNotifier>().currentLocale,
            themeMode: context.watch<ThemeNotifier>().themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              fontFamily: 'Calibri',
              primaryColor: Provider.of<ThemeNotifier>(context, listen: false).primaryColor,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: 'Calibri',
              primaryColor: Provider.of<ThemeNotifier>(context, listen: false).primaryColor,
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('tr'),
              Locale('en'),
              Locale('ru'),
              Locale('de'),
              Locale('ar'),
            ],
            home: const Home(),
          );
        },
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hasInternet = false;
  Future checkUserConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          hasInternet = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        hasInternet = false;
      });
    }
  }

  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPIKey =
      ""; // Replace with your API key

  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};

  LatLng startLocation = const LatLng(40.9987143, 39.6901263);
  LatLng endLocation = const LatLng(40.6166000, 39.7084000);
  LatLng homeLocation = const LatLng(40.8206762648865, 39.69222508441611);

  @override
  void initState() {
    super.initState();
    checkUserConnection();
    _checkPermission();
    getDirections().then((_) {
      _initMap();
    });
  }

  Future<void> _checkPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      print('Konum izni zaten alınmış');
    } else if (status.isDenied) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LocationPermissionScreen(
            onPermissionGranted: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const Home())); // LocationPermissionScreen'dan çık
              setState(() {}); // State'i güncelle
            },
          ),
        ),
      );
    } else {
      openAppSettings();
    }
  }

  void _restartApp(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const MyApp()),
          (Route<dynamic> route) => false,
    );
  }

  void _initMap() {

    markers.add(Marker(
      markerId: MarkerId(startLocation.toString()),
      position: startLocation,
      icon: BitmapDescriptor.defaultMarker,
      onTap: () {},
    ));

    markers.add(Marker(
      markerId: MarkerId(endLocation.toString()),
      position: endLocation,
      icon: BitmapDescriptor.defaultMarker,
      onTap: () {},
    ));

    getDirections();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];
    PolylineRequest request = PolylineRequest(
      origin: PointLatLng(startLocation.latitude, startLocation.longitude),
      destination: PointLatLng(endLocation.latitude, endLocation.longitude),
       mode: TravelMode.driving,
    );

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleAPIKey, // API anahtarı
      request: request, // Request nesnesi
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    addPolyline(polylineCoordinates);
  }

  addPolyline(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Provider.of<ThemeNotifier>(context, listen: false).primaryColor,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeNotifier themeNotifier = context.read<ThemeNotifier>();
    if (!hasInternet) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.int),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.signal_wifi_off,
                size: 100,
                color: Colors.red,
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.int,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  AppLocalizations.of(context)!.intcumle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _restartApp(context);
                },
                child: Text(AppLocalizations.of(context)!.yenidendene),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      drawer: const SidebarNavigation(),
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeNotifier>(context, listen: false).primaryColor,
        title: Text(
          AppLocalizations.of(context)!.anabasisyol,
          style: TextStyle(
            color: themeNotifier.themeMode == ThemeMode.dark
                ? Colors.black // Karanlık modda beyaz
                : Colors.white, // Açık modda siyah
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info,
              color: themeNotifier.themeMode == ThemeMode.dark
                  ? Colors.black // Karanlık modda beyaz
                  : Colors.white, // Açık modda siyah
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: homeLocation,
              zoom: 10.7,
            ),
            markers: markers,
            polylines: Set<Polyline>.of(polylines.values),
            mapType: MapType.hybrid,
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            child: MapNavigationButton(
              originLatitude: startLocation.latitude,
              originLongitude: startLocation.longitude,
              destinationLatitude: endLocation.latitude,
              destinationLongitude: endLocation.longitude,
              onDirectionsRequested: getDirections,
            ),
          )
        ],
      ),
    );
  }
}

class LocationPermissionScreen extends StatelessWidget {
  final Function() onPermissionGranted;

  const LocationPermissionScreen({Key? key, required this.onPermissionGranted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(AppLocalizations.of(context)!.konumIzni),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.konumIzniGerekiyor,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppLocalizations.of(context)!.konumIzniTalimat,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _requestPermission(context);
              },
              child:  Text(AppLocalizations.of(context)!.izinVer),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _requestPermission(BuildContext context) async {
    var result = await Permission.location.request();
    if (result.isGranted) {
      onPermissionGranted(); // İzin verildiğinde geri dönüş yapılıyor
    } else {
      // İsterseniz bir uyarı gösterilebilir.
    }
  }
}
