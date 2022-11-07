import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../provider/google_sign_in.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            //Aca añadimos mas metodos de inicio de sesion si lo llegamos a necesitar
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // <-- Radius
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                label: const Text('Iniciar sesion con Google',
                    style: TextStyle(color: Colors.white)))
          ],
        ),
      );
}
