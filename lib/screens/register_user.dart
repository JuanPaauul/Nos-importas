import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import 'package:nos_importas/screens/maps/screen_redirect.dart';
import 'dart:convert';
import 'package:nos_importas/screens/route/routes.dart';

import 'app_screen.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

final user = FirebaseAuth.instance.currentUser!;

class _RegisterUserState extends State<RegisterUser> {
  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _lastNameTEC = TextEditingController();
  final TextEditingController _phoneNumberTEC = TextEditingController();
  final TextEditingController _cityTEC = TextEditingController();
  final TextEditingController _provinceTEC = TextEditingController();

  var phoneNumberMask = MaskTextInputFormatter(
      mask: '(+###) ###########', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    print(user.uid.characters);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg-image.png'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    subTitle(),
                    Row(
                      children: [
                        formTitle(),
                        const Spacer(),
                        SizedBox(
                          height: 70,
                          child: Image.asset('assets/icon-white.png'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    inputForm("Su Nombre", false, _nameTEC, Colors.white),
                    inputForm("Su Apellido", false, _lastNameTEC, Colors.white),
                    inputPhoneNumber("Numero de celular", _phoneNumberTEC),
                    Row(
                      children: [
                        inputForm("Su Ciudad", true, _cityTEC, Colors.white),
                        inputForm(
                            "Su Provincia", true, _provinceTEC, Colors.white),
                      ],
                    ),
                    const SizedBox(
                      height: 140,
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          if (await registerUser()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FirstView()));
                            Navigator.pushReplacementNamed(
                                context, Routes.FIRSTVIEW);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Color.fromRGBO(42, 59, 113, 1),
                                width: 2)),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Crear cuenta",
                              style: TextStyle(
                                  color: Color.fromRGBO(42, 59, 113, 1),
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal)),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding formTitle() {
    return const Padding(
      padding: EdgeInsets.all(7.0),
      child: SizedBox(
        child: Text(
          "Regístrate",
          style: TextStyle(
              fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Padding subTitle() {
    return const Padding(
      padding: EdgeInsets.all(7.0),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          "Parece que no tienes una cuenta! Por favor",
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Container inputForm(String placeholder, bool splitWidth,
      TextEditingController controller, Color selectedColor) {
    var widthOfWidget = 1.0;
    splitWidth ? widthOfWidget = 2.55 : widthOfWidget = 1;
    return Container(
      width: MediaQuery.of(context).size.width / widthOfWidget,
      margin: const EdgeInsets.all(7),
      child: TextFormField(
          controller: controller,
          style: TextStyle(
            color: selectedColor,
            fontSize: 20,
          ),
          decoration: InputDecoration(
            labelText: placeholder,
            labelStyle: TextStyle(color: selectedColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: selectedColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: selectedColor),
            ),
          )),
    );
  }

  Container inputPhoneNumber(
      String placeholder, TextEditingController controller) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(7),
      child: TextFormField(
        controller: controller,
        inputFormatters: [phoneNumberMask],
        keyboardType: TextInputType.phone,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.phone_android,
            color: Colors.white,
          ),
          labelText: placeholder,
          labelStyle: const TextStyle(color: Colors.white),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
          ),
        ),
      ),
    );
  }

  Future<bool> registerUser() async {
    String uid = user.uid;
    String name = _nameTEC.text;
    String lastName = _lastNameTEC.text;
    String phoneNumber = _phoneNumberTEC.text;
    String city = _cityTEC.text;
    String province = _provinceTEC.text;

    var postBody = {
      'userId': user.uid,
      'firstName': name,
      'lastName': lastName,
      'email': user.email,
      'phone': phoneNumber,
      'city': city,
      'province': province
    };

    var postBodyEncoded = json.encode(postBody);

    var url = Uri.parse(
        'https://appprevriskapi-production.up.railway.app/api/userinformation');
    var response = await http.post(url, body: postBodyEncoded, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });

    return response.statusCode == 201;
  }
}
