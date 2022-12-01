import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nos_importas/screens/maps/screen_redirect.dart';
import 'package:nos_importas/screens/register_user.dart';
import 'package:nos_importas/screens/sign_up_screen.dart';
import '../widget/login_handler.dart';
import 'app_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  get http => null;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return LoginHandler();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Hubo un error!'));
            } else {
              return const SignUpPage();
            }
          },
        ),
      );
}
