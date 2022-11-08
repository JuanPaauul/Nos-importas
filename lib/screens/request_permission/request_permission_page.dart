import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nos_importas/screens/request_permission/request_permission_controller.dart';
import 'package:nos_importas/screens/route/routes.dart';
import 'package:permission_handler/permission_handler.dart';

import '../app_screen.dart';

class RequestPermissionPage extends StatefulWidget {
  const RequestPermissionPage({super.key});

  @override
  State<RequestPermissionPage> createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage> {
  final _controller = RequestPermissionController(Permission.locationWhenInUse);
  late StreamSubscription _subscription;
  @override
  void initState() {
    super.initState();
    _subscription = _controller.onStatusChanged.listen((status) {
      if (status == PermissionStatus.granted) {
        //NavigationBar.pushRemplacementNamed;
        //Navigator.pushReplacementNamed(context, Routes.VIEWS);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AppPage()));
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: ElevatedButton(
          child: Text("Permitir que usemos tu ubicacion"),
          onPressed: () {
            _controller.request();
          },
        ),
      )),
    );
  }
}
