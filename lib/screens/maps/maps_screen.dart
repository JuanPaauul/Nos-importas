import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*import 'package:nos_importas/functions/input_file.dart';
import 'package:nos_importas/screens/app_screen.dart';*/
import 'package:nos_importas/screens/maps/maps_controller.dart';
import 'package:nos_importas/screens/maps/screen_redirect.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

bool check = false;
/*
void showAlert(context) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.error,
    title: 'Reporte de Zona',
    text: 'Tu estas fuera del area segura',
  );
}*/

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);
/*
  @override
  _MapsPageState createState() => _MapsPageState();*/
  /*
  void _showDialog(BuildContext newContext) {
    showDialog(
    barrierDismissible: false,
        context: newContext,
        child :AlertDialog(
            title: Text('Zona peligrosa'),
            content: Text(
                'Usted acaba de ingresar a una zona preligros, !Puede que se encuntre en riesgo'),
            actions: [
              MaterialButton(
                onPressed: () {},
                child: Text('De Acuerdo'),
              )
            ],
          );
        });
  }
*/
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapsController>(
      create: (_) {
        final controller = MapsController();
        return controller;
      },
      child: Scaffold(
        body: Selector<MapsController, bool>(
            selector: (_, controller) => controller.loading,
            builder: (context, loading, child) {
              return Consumer<MapsController>(builder: (_, controller, __) {
                if (!controller.gpsEnabled) {
                  return Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      const Text("Tu gps estaapagado"),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "El mapa esta cargando",
                            textAlign: TextAlign.center,
                          ))
                    ]),
                  );
                }

                final initialCameraPosition = CameraPosition(
                  target: LatLng(
                    controller.initialPosition!.latitude,
                    controller.initialPosition!.longitude,
                  ),
                  zoom: 15,
                );

                print(controller.initialPosition!.latitude);
                print(controller.initialPosition!.longitude);
                //controller.newPolygon();
                check = controller.checkoutUpdateLocation(LatLng(
                    controller.initialPosition!.latitude,
                    controller.initialPosition!.longitude));

                print(check);
                if (check == true) {
                  return (AlertDialog(
                    title: Text('Zona peligrosa'),
                    content: Text(
                        'Usted acaba de ingresar a una zona preligros, !Puede que se encuntre en riesgo'),
                    actions: [
                      TextButton(onPressed: () {}, child: Text('Estoy bien')),
                    ],
                  ));
                  /**/ /*
                  return  Scaffold(
                    body: 
                      child: 
                        showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('Zona peligrosa'),
                            content: Text(
                                'Usted acaba de ingresar a una zona preligros, !Puede que se encuntre en riesgo'),
                            actions: [
                              MaterialButton(
                                onPressed: () {NavigationBar.pop(context);},
                                child: Text('De Acuerdo'),
                              )
                            ],
                          );
                        });
                  );*/
                }
                return GoogleMap(
                  markers: controller.markers,
                  //polylines: controller.polylines,
                  polygons: controller.polygons,
                  //onMapCreated: _controller.onMapCreated,
                  initialCameraPosition: initialCameraPosition,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  //onTap: (position) { print(position); },
                  onTap: controller.onTap,
                );
              });
            }),
      ),
    );
  }
}
/*
class _MapsPageState extends State<MapsPage> {
  final _controller = MapsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<MapsController, bool>(
        selector: (_, controller) => _controller.loading,
      ),
    );
  }
}
/*
body: GoogleMap(
        //markers: _controller.markers,
        //onMapCreated: _controller.onMapCreated,
        initialCameraPosition: _controller.initialCameraPosition,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        //onTap: (position) { print(position); },
        //onTap: _controller.onTap,
      ),*/*/