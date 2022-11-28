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
      body: Column(
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
          inputEmail(
              "Correo electronico del usuario de confianza", false, _emailTEC),
          //Botton to send request
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                            title: const Text(
                                'Solicitud para nuevo\nusuario de confianza'),
                            content:
                                const Text('¡Solicitud enviada\ncon éxito!'),
                            actions: <Widget>[
                              FloatingActionButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              )
                            ]));
              },
              child: const Text("Enviar solicitud",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal))),
        ],
      ),
    );
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
