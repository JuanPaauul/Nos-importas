import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nos_importas/screens/register_user.dart';
import 'package:nos_importas/widget/background.dart';
import 'package:email_validator/email_validator.dart';

//import 'package:nos_importas/screens/app_screen.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Añadir usuario de confianza",
        ),
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          // ignore: prefer_const_constructors
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Tittle
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Por favor, ingrese el correo electronico de su",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromRGBO(53, 167, 219, 1)),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Usuario de Confianza",
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromRGBO(53, 167, 219, 1),
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              //Gmail form
              inputEmail("Correo electronico del usuario de confianza", false,
                  _emailTEC),
              //Botton to send request
              ElevatedButton(
                  onPressed: () {
                    dialogMessage(context, _emailTEC.value.text);
                  },
                  child: const Text("Enviar solicitud",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal))),
            ],
          ),
          // ignore: prefer_const_constructors
        ],
      ),
    );
  }

  Future<String> notifyUser(String email) async {
    final response = await http.get(Uri.parse(
        "https://appprevriskapi-production.up.railway.app/api/userinformation/email/${email}"));
    if (response.statusCode == 200) {
      return "El usuario fue notificado";
    }
    return "Se envio una correo de invitacion al usuario";
  }

  Future<dynamic> dialogMessage(BuildContext context, String email) async {
    String messageContent = "";
    EmailValidator.validate(email)
        ? messageContent = await notifyUser(_emailTEC.value.text)
        : messageContent = "Escribe un correo electronico válido!";
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
                title: const Text('Solicitud para nuevo\nusuario de confianza'),
                content: Text(messageContent),
                actions: <Widget>[
                  FloatingActionButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  )
                ]));
  }

  Container inputEmail(
      String placeholder, bool splitWidth, TextEditingController controller) {
    var widthOfWidget = 1.0;
    splitWidth ? widthOfWidget = 2.33 : widthOfWidget = 1;
    return Container(
      width: MediaQuery.of(context).size.width / widthOfWidget,
      margin: const EdgeInsets.all(20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
            border: const OutlineInputBorder(), labelText: placeholder),
      ),
    );
  }

  
}
