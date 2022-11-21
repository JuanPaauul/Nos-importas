import 'package:flutter/cupertino.dart';
import 'package:nos_importas/screens/app_screen.dart';
import 'package:nos_importas/screens/home_screen.dart';
import 'package:nos_importas/screens/maps/maps_screen.dart';
import 'package:nos_importas/screens/maps/request_permission/request_permission_page.dart';
import 'package:nos_importas/screens/route/routes.dart';
import 'package:nos_importas/screens/maps/screen_redirect.dart';
import 'package:nos_importas/screens/maps/screen_redirect.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const HomePage(),
    Routes.VIEWS: (_) => const AppPage(),
    Routes.MAPS: (_) => const MapsPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.FIRSTVIEW: (_) => const FirstView(),
  };
}
