import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../provider/google_sign_in.dart';

class UserFormWidget extends StatelessWidget {
  const UserFormWidget({super.key});

  Container formName() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Nombre"),
        ));
  }

  Container formGmail() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: "Correo electronico"),
        ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text("Crear usuario de confianza"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Por favor añada los datos de su usuario de confianza",
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(53, 167, 219, 1)),
              ),
              const SizedBox(
                height: 20,
              ),
              formName(),
              const SizedBox(
                height: 10,
              ),
              formGmail(),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (() {}), child: const Text("Añadir"))
            ],
          ),
        ),
      );
}
