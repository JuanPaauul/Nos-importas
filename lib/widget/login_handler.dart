import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nos_importas/screens/app_screen.dart';
import '../screens/register_user.dart';

class LoginHandler extends StatelessWidget {
  const LoginHandler({super.key});

  Future<Response> userExists(User user) async {
    final response = await http.get(Uri.parse(
        "https://appprevriskapi-production.up.railway.app/api/userinformation/uid/${user.uid}"));
    return response;
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return FutureBuilder<Response>(
      future: userExists(user),
      builder: (context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data?.statusCode == 200) {
            return const AppPage();
          } else {
            return const RegisterUser();
          }
        } else {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(
                height: 30,
              ),
              Text("Verificando datos de la cuenta",
                  style: TextStyle(
                    color: Color.fromRGBO(53, 167, 219, 1),
                    fontSize: 20,
                  ))
            ],
          ));
        }
      },
    );
  }
}