import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final _initialCameraPosition = CameraPosition(
  target: LatLng(-17.3793081, -66.1534358),
  zoom: 3,
);

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: GoogleMap(initialCameraPosition: _initialCameraPosition),
    );
  }
}
