import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nos_importas/provider/google_sign_in.dart';
import 'package:nos_importas/screens/home_screen.dart';
import 'package:nos_importas/screens/route/pages.dart';
import 'package:nos_importas/screens/route/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Main page';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          initialRoute: Routes.SPLASH,
          routes: appRoutes(),
        ),
      );
}
