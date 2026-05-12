import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:anabasis/generated/app_localizations.dart';

class OtelPage extends StatefulWidget {
  const OtelPage({Key? key}) : super(key: key);

  @override
  _OtelState createState() => _OtelState();
}

class _OtelState extends State<OtelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.otel),
      ),
      body: const OtelHaritaState(),
    );
  }
}

class OtelHaritaState extends StatefulWidget {
  const OtelHaritaState({Key? key}) : super(key: key);

  @override
  _OtelHaritaState createState() => _OtelHaritaState();
}

class _OtelHaritaState extends State<OtelHaritaState> {
  GoogleMapController? mapController;
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPIKey = "AIzaSyAKH6d1oamW2_tEdGbNFdUe0Jv5XBUk2FA";

  Set<Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};

  LatLng startLocation = const LatLng(40.9987143, 39.6901263);
  LatLng endLocation = const LatLng(40.6166000, 39.7084000);
  LatLng homeLocation = const LatLng(40.8206762648865, 39.69222508441611);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    markers.add(Marker(
      markerId: MarkerId(const LatLng(41.00837925889521, 39.72667849673823).toString()),
      position: const LatLng(41.00837925889521, 39.72667849673823  ),
      infoWindow: InfoWindow(
        title: '${AppLocalizations.of(context)!.otel}1',
        snippet: AppLocalizations.of(context)!.yoltarif,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    ));

    markers.add(Marker(
      markerId: MarkerId(const LatLng(441.00723938950322, 39.73369697763939).toString()),
      position: const LatLng(41.00723938950322, 39.73369697763939),
      infoWindow: InfoWindow(
        title: '${AppLocalizations.of(context)!.otel}2',
        snippet: AppLocalizations.of(context)!.yoltarif,
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));

    markers.add(Marker(
        markerId : MarkerId(const LatLng(40.86393431602708, 39.68234627099127).toString()),
        position: const LatLng(40.86393431602708, 39.68234627099127),
        infoWindow:  InfoWindow(
          title: '${AppLocalizations.of(context)!.otel}3',
          snippet: AppLocalizations.of(context)!.yoltarif,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet)
    ));

    markers.add(Marker(
      markerId: MarkerId(const LatLng(40.86067059761031, 39.679108669053555).toString()),
      position: const LatLng(40.86067059761031, 39.679108669053555),
      infoWindow: InfoWindow(
        title: '${AppLocalizations.of(context)!.otel}4',
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
