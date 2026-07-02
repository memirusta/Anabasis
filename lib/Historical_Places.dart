import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:anabasis/generated/app_localizations.dart';
import 'package:anabasis/PlacesPage.dart';
import 'package:anabasis/theme_notifier.dart';
import 'package:provider/provider.dart';

class HistoricPlacesPage extends StatefulWidget {
  const HistoricPlacesPage({Key? key}) : super(key: key);

  @override
  _HistoricPlacesPageState createState() => _HistoricPlacesPageState();
}

class _HistoricPlacesPageState extends State<HistoricPlacesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.tmekan),
      ),
      body: const HistoricPlacesState(),
    );
  }
}

class HistoricPlacesState extends StatefulWidget {
  const HistoricPlacesState({Key? key}) : super(key: key);

  @override
  _HistoricPlacesState createState() => _HistoricPlacesState();
}

class _HistoricPlacesState extends State<HistoricPlacesState> {
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPIKey = "";

  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};

  LatLng startLocation = const LatLng(40.9987143, 39.6901263);
  LatLng endLocation = const LatLng(40.6166000, 39.7084000);
  LatLng homeLocation = const LatLng(40.8206762648865, 39.69222508441611);
  LatLng SumelaManastiri = const LatLng(40.690297475921405, 39.658346616861635);
  LatLng KiliseKalinti = const LatLng(40.790844518654914, 39.62655742442609);
  LatLng Yayla = const LatLng(40.66953558620199, 39.69439747044871);
  LatLng VManastiri = const LatLng(40.76198952431119, 39.53013865696186);
  LatLng KManastiri = const LatLng(40.80284530476671, 39.707192907232816);
  LatLng Tepe = const LatLng(40.67127294492761, 39.69657542442007);

  @override
  void initState() {
    super.initState();
    getDirections();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    markers.add(Marker(
      markerId: MarkerId(startLocation.toString()),
      position: startLocation,
      infoWindow: InfoWindow(
        title: AppLocalizations.of(context)!.baslangic,
        snippet: AppLocalizations.of(context)!.yoltarif,
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));

    markers.add(Marker(
      markerId: MarkerId(KiliseKalinti.toString()),
      position: KiliseKalinti,
      infoWindow: InfoWindow(
        title: AppLocalizations.of(context)!.kilisekalinti,
        snippet: '',
      ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: false,
          context: context,
          builder: (BuildContext context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 1, // Set a larger initial size
              maxChildSize: 1, // Set a larger max size
              minChildSize: 0.4,
              builder: (BuildContext context, ScrollController scrollController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppBar(
                      title: Text(AppLocalizations.of(context)!.kilisekalinti),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Image.asset(
                              'assets/flags/10688214_756050571110628_5853901282819743571_o.jpg',
                              width: 400.0,
                              height: 400.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          AppLocalizations.of(context)!.kilisekalinti,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const KalintiButon(
                      destinationLatitude: 40.79063, // Sümela Manastırının latitude koordinatı
                      destinationLongitude: 39.62647, // Sümela Manastırının longitude koordinatı
                    ),
                  ],
                );
              }, // <-- Added a missing closing parenthesis here
            );
          },
        );
      },
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    ));


    markers.add(Marker(
      markerId: MarkerId(VManastiri.toString()),
      position: VManastiri,
      infoWindow: InfoWindow(
        title: AppLocalizations.of(context)?.vmanastir,
        snippet: '',
      ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: false,
          context: context,
          builder: (BuildContext context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 1, // Set a larger initial size
              maxChildSize: 1, // Set a larger max size
              minChildSize: 0.4,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppBar(
                      title: Text(AppLocalizations.of(context)!.vmanastir),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Image.asset(
                              'assets/flags/2019-08-16.jpg',
                              width: 400.0,
                              height: 400.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          AppLocalizations.of(context)!.vmanastir,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => VazelonSayfa(context),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 400),
                          ),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.dahafazla),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
    ));

    markers.add(Marker(
      markerId: MarkerId(Tepe.toString()),
      position: Tepe,
      infoWindow: InfoWindow(
        title: AppLocalizations.of(context)?.yayla,
        snippet: '',
      ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: false,
          context: context,
          builder: (BuildContext context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 1, // Set a larger initial size
              maxChildSize: 1, // Set a larger max size
              minChildSize: 0.4,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppBar(
                      title: Text(AppLocalizations.of(context)!.yayla),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Image.asset(
                              'assets/flags/Iskobel-Yaylasi_compressed.jpg',
                              width: 400.0,
                              height: 400.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          AppLocalizations.of(context)!.tepe,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const IskopelSayfa(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 400),
                          ),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.dahafazla),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ));

    markers.add(
      Marker(
        markerId: MarkerId(SumelaManastiri.toString()),
        position: SumelaManastiri,
        infoWindow: InfoWindow(
          title: AppLocalizations.of(context)?.smanastir,
          snippet: '',
        ),
        onTap: () async {
          showModalBottomSheet(
            isScrollControlled: false,
            context: context,
            builder: (BuildContext context) {
              return DraggableScrollableSheet(
                expand: false,
                initialChildSize: 1, // Set a larger initial size
                maxChildSize: 1, // Set a larger max size
                minChildSize: 0.5,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppBar(
                        title: Text(AppLocalizations.of(context)!.smanastir),
                        actions: [
                          IconButton(
                            icon: const Icon(Icons.arrow_downward),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: scrollController,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Image.asset(
                                index == 0
                                    ? 'assets/flags/thumbs_b_c_b48ff6d472cfe323d270d8e7e3c6c1a3.jpg'
                                    : 'assets/flags/download.jpeg',
                                width: 400.0,
                                height: 400.0,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            AppLocalizations.of(context)!.smanastir,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => const SumelaSayfa(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;
                                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                              transitionDuration: const Duration(milliseconds: 400),
                            ),
                          );
                        },
                        child: Text(AppLocalizations.of(context)!.dahafazla),
                      ),

                    ],
                  );
                },
              );
            },
          );
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );


    markers.add(Marker(
      markerId: MarkerId(KManastiri.toString()),
      position: KManastiri,
      infoWindow: InfoWindow(
        title: AppLocalizations.of(context)?.kmanastir,
        snippet: '',
      ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: false,
          context: context,
          builder: (BuildContext context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 1, // Set a larger initial size
              maxChildSize: 1, // Set a larger max size
              minChildSize: 0.5,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppBar(
                      title: Text(AppLocalizations.of(context)!.kmanastir),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: scrollController,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Image.asset(
                              'assets/flags/download (1).jpeg',
                              width: 400.0,
                              height: 400.0,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          AppLocalizations.of(context)!.kmanastir,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => KustulSayfa(context),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              const begin = Offset(1.0, 0.0);
                              const end = Offset.zero;
                              const curve = Curves.easeInOut;
                              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                            transitionDuration: const Duration(milliseconds: 400),
                          ),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.dahafazla),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    ));

    markers.add(Marker(
      markerId: MarkerId(endLocation.toString()),
      position: endLocation,
      infoWindow: InfoWindow(
        title: AppLocalizations.of(context)?.bitis,
        snippet: AppLocalizations.of(context)?.yoltarif,
      ),
      icon: BitmapDescriptor.defaultMarker,
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
      googleApiKey: "",
      request: request,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: GoogleMap(
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
        ),
      ],
    );
  }
}
