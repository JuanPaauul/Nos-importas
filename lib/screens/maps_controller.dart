import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nos_importas/screens/utils/map_style.dart';

class MapsController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};
  final Map<PolylineId, Polyline> _polylines = {};
  final Map<PolygonId, Polygon> _polygons = {};

  Set<Marker> get markers => _markers.values.toSet();
  Set<Polyline> get polylines => _polylines.values.toSet();
  Set<Polygon> get polygons => _polygons.values.toSet();
  // Stream<String> get onMarker => _markersController.stream;

  late bool _gpsEnabled = false;
  bool _loading = false;
  bool get loading => _loading;
  bool get gpsEnabled => _gpsEnabled;
  StreamSubscription? _gpsSubscription;
  String _polygonId = '0';
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  MapsController() {
    _init();
  }
  Future _init() async {
    _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    print(_gpsEnabled);
    _loading = true;
    _gpsSubscription = Geolocator.getServiceStatusStream().listen(
      (status) {
        _gpsEnabled = status == ServiceStatus.enabled;
        notifyListeners();
      },
    );
    if (_gpsEnabled) {
      _initialPosition = await Geolocator.getCurrentPosition();
    }
    notifyListeners();
  }

  Future<void> turnOnGps() => Geolocator.openAppSettings();
  /*final initialCameraPosition = const CameraPosition(
    target: LatLng(-17.3793081, -66.1534358),
    zoom: 15,
  );*/
  void newPolygon() {
    _polygonId = DateTime.now().millisecondsSinceEpoch.toString();
  }

  Position? _initialPosition;
  Position? get initialPosition => _initialPosition;

  void onTap(LatLng position) async {
    final polygonId = PolygonId(_polygonId);
    late Polygon polygon;
    if (_polygons.containsKey(polygonId)) {
      final tmp = _polygons[polygonId]!;
      polygon = tmp.copyWith(
        pointsParam: [...tmp.points, position],
      );
    } else {
      //final color = Colors.primaries[_polygons.length];
      final color = Colors.red;
      polygon = Polygon(
          polygonId: polygonId,
          points: [position],
          strokeWidth: 4,
          strokeColor: color,
          fillColor: color.withOpacity(0.4));
    }
    _polygons[polygonId] = polygon;
    notifyListeners();
  }

  @override
  void dispose() {
    _gpsSubscription?.cancel();
    super.dispose();
  }
}
