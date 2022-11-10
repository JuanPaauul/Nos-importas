import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nos_importas/screens/utils/map_style.dart';

class MapsController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};
  final Map<PolylineId, Polyline> _polylines = {};
  Set<Marker> get markers => _markers.values.toSet();
  Set<Polyline> get polylines => _polylines.values.toSet();
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  bool _loading = true;
  bool get loading => _loading;
  late bool _gpsEnabled;
  bool get gpsEnabled => _gpsEnabled;
  StreamSubscription? _gpsSubscription;

  MapsController() {
    _init();
  }
  Future _init() async {
    _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    _loading = false;
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
  Position? _initialPosition;
  Position? get initialPosition => _initialPosition;
  void onTap(LatLng position) {
    /*final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(markerId: markerId, position: position);
    _markers[markerId] = marker;*/
    const PolylineId polylineId = PolylineId('group');
    late Polyline polyline;
    if (_polylines.containsKey(polylineId)) {
      final tmp = _polylines[polylineId]!;
      polyline = tmp.copyWith(pointsParam: [...tmp.points, position]);
    } else {
      polyline = Polyline(
          polylineId: polylineId,
          points: [position],
          width: 2,
          color: Colors.green);
    }
    _polylines[polylineId] = polyline;
    notifyListeners();
  }

  @override
  void dispose() {
    _gpsSubscription?.cancel();
    super.dispose();
  }
}
