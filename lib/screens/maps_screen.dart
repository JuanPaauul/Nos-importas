import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nos_importas/screens/maps_controller.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final _controller = MapsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: _controller.markers,
        onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _controller.initialCameraPosition,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        //onTap: (position) { print(position); },
        //onTap: _controller.onTap,
      ),
    );
  }
}
