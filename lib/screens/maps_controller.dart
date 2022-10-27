import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nos_importas/screens/utils/map_style.dart';

class MapsController {
  final Map<MarkerId, Marker> _markers = {};
  Set<Marker> get markers => _markers.values.toSet();
  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  final initialCameraPosition = const CameraPosition(
    target: LatLng(-17.3793081, -66.1534358),
    zoom: 15,
  );

  void onTap(LatLng position) {
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(markerId: markerId, position: position);
    _markers[markerId] = marker;
  }
}
