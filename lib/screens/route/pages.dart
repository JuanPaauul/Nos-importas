import 'package:flutter/cupertino.dart';
import 'package:nos_importas/screens/app_screen.dart';
import 'package:nos_importas/screens/home_screen.dart';
import 'package:nos_importas/screens/maps_screen.dart';
import 'package:nos_importas/screens/request_permission/request_permission_page.dart';
import 'package:nos_importas/screens/route/routes.dart';
import 'package:nos_importas/screens/screen_redirect.dart';
import 'package:nos_importas/screens/screen_redirect.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => HomePage(),
    Routes.VIEWS: (_) => const AppPage(),
    Routes.MAPS: (_) => const MapsPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.FIRSTVIEW: (_) => const FirstView(),
  };
}
