import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:anabasis/generated/app_localizations.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.restaurant),
      ),
      body: const RestaurantHaritaState(),
    );
  }
}

class RestaurantHaritaState extends StatefulWidget {
  const RestaurantHaritaState({Key? key}) : super(key: key);

  @override
  _RestaurantHaritaState createState() => _RestaurantHaritaState();
}

class _RestaurantHaritaState extends State<RestaurantHaritaState> {
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPIKey = "";

  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};

  LatLng startLocation = const LatLng(40.9987143, 39.6901263);
  LatLng endLocation = const LatLng(40.6166000, 39.7084000);
  LatLng homeLocation = const LatLng(40.8206762648865, 39.69222508441611);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    markers.add(Marker(
      markerId: MarkerId(const LatLng(41.00222164503565, 39.69254040021374).toString()),
      position: const LatLng(41.00222164503565, 39.69254040021374),
      infoWindow: InfoWindow(
        title: '${AppLocalizations.of(context)!.restaurant}1',
        snippet: AppLocalizations.of(context)!.yoltarif,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    markers.add(Marker(
      markerId: MarkerId(const LatLng(41.0081239907936, 39.72333219261912).toString()),
      position: const LatLng(41.0081239907936, 39.72333219261912),
      infoWindow: InfoWindow(
        title: '${AppLocalizations.of(context)!.restaurant}2',
        snippet: AppLocalizations.of(context)!.yoltarif,
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));

    markers.add(Marker(
      markerId : MarkerId(const LatLng(40.88037559222937, 39.68506275909684).toString()),
      position: const LatLng(40.88037559222937, 39.68506275909684),
      infoWindow:  InfoWindow(
        title: '${AppLocalizations.of(context)!.restaurant}3',
          snippet: AppLocalizations.of(context)!.yoltarif,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet)
    ));

    markers.add(Marker(
      markerId: MarkerId(const LatLng(40.80191207628528, 39.62225081162485).toString()),
      position: const LatLng(40.80191207628528, 39.62225081162485),
      infoWindow: InfoWindow(
        title: '${AppLocalizations.of(context)!.restaurant}4',
        snippet: AppLocalizations.of(context)!.yoltarif,
      ),
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
      googleApiKey: "AIzaSyBOV7p1nI9ewoPIX1JhVj4KJw_Ho_XYWH0",
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
      color: Colors.green,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
      ],
    );
  }
}
