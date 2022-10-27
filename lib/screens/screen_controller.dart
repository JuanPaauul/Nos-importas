import 'package:flutter/cupertino.dart';
import 'package:nos_importas/screens/route/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class ScreenController extends ChangeNotifier {
  final Permission _locationPermisiion;
  String? _routeName;
  String? get routeName => _routeName;
  ScreenController(this._locationPermisiion);

  Future<void> checkPermission() async {
    final isGranted = await _locationPermisiion.isGranted;
    _routeName = isGranted ? Routes.MAPS : Routes.PERMISSIONS;
    notifyListeners();
  }
}
