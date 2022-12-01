import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nos_importas/screens/utils/map_style.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as map_tool;

class MapsController extends ChangeNotifier {
  final Map<MarkerId, Marker> _markers = {};
  final Map<PolylineId, Polyline> _polylines = {};
  final Map<PolygonId, Polygon> _polygons = {};

  Set<Marker> get markers => _markers.values.toSet();
  Set<Polyline> get polylines => _polylines.values.toSet();
  Set<Polygon> get polygons => _polygons.values.toSet();
  // Stream<String> get onMarker => _markersController.stream;
  bool isInSelectedArea = true;
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
  @override
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
  /**/ List<LatLng> polyPointsListCasa = [
    LatLng(-17.354536, -66.155990),
    LatLng(-17.354793, -66.155054),
    LatLng(-17.355611, -66.155254),
    LatLng(-17.355153, -66.156244)
  ];

  List<LatLng> coorRed = [
    //punta superior norteoes
    LatLng(-17.369556, -66.143199),
    // supe norte este
    LatLng(-17.370425, -66.141671),
    //punta infe sud este
    LatLng(-17.373822, -66.142293),
    //punta inferior sud oeste
    LatLng(-17.373625, -66.144058)
  ];
  List<LatLng> coorGreen = [
    //punta superior norteste
    LatLng(-17.369556, -66.143199),
    // supe norte oeste
    LatLng(-17.369045, -66.144217),
    //punta infe sud oeste
    LatLng(-17.373526, -66.145913),
    //punta inferior sud este
    LatLng(-17.373625, -66.144058)
  ];
  /*void checkoutUpdateLocation(LatLng poitLatLng) {
    setState(() {
      isInSelectedArea = map_tool.PolygonUtil.containsLocation(
        poitLatLng as map_tool.LatLng,
        polyPointsListCasa as List<map_tool.LatLng>,
        false,
      );
    });
  }*/

  void drawPolygon(position) {
    newPolygon();
    final polygonId = PolygonId(_polygonId);
    late Polygon polygon;
    if (_polygons.containsKey(polygonId)) {
      final tmp = _polygons[polygonId]!;
      polygon = tmp.copyWith(
        pointsParam: [...tmp.points, position],
      );
    } else {
      //final color = Colors.primaries[_polygons.length];
      final color = Color.fromARGB(255, 70, 244, 54);
      polygon = Polygon(
          polygonId: polygonId,
          points: coorGreen,
          strokeWidth: 4,
          strokeColor: color,
          fillColor: color.withOpacity(0.4));
    }
    _polygons[polygonId] = polygon;
    notifyListeners();
  }

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
          points: coorRed,
          strokeWidth: 4,
          strokeColor: color,
          fillColor: color.withOpacity(0.4));
      drawPolygon(position);
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
