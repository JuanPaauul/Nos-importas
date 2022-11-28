import 'package:flutter/material.dart';
import 'package:nos_importas/screens/user_confidence_list.dart';
import 'package:nos_importas/functions/input_file.dart';
//import 'package:nos_importas/screens/app_screen.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          //Tittle
          const Text(
            "Añadir usuario\nde confianza",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //Gmail form
          formGmail(),
          const SizedBox(
            height: 10,
          ),
          //Botton to send request
          MaterialButton(
            minWidth: double.infinity,
            height: 60,
            onPressed: () {
              /*Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PanicPage()));*/

              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                          title: const Text(
                              'Solicitud para nuevo\nusuario de confianza'),
                          content: const Text('¡Solicitud enviada\ncon éxito!'),
                          actions: <Widget>[
                            FloatingActionButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                            )
                          ]));
            },
            color: const Color(0xff0095FF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: const Text(
              "Enviar solicitud",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Container formGmail() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
              hintText: "Correo de Usuario de confianza",
              border: InputBorder.none),
        ));
  }
}
