import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(7.0),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  "Registrarse",
                  style: TextStyle(
                      fontSize: 30, color: Color.fromRGBO(53, 167, 219, 1)),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            inputForm("Su Nombre", false, _nameTEC),
            inputForm("Su Apellido", false, _lastNameTEC),
            inputPhoneNumber("(+591) 7777777", _phoneNumberTEC),
            Row(
              children: [
                inputForm("Su Ciudad", true, _cityTEC),
                inputForm("Su Provincia", true, _provinceTEC),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  registerUser();
                },
                child: const Text("Crear cuenta")),
          ],
        ),
      ),
    );
  }

  Container inputForm(
      String placeholder, bool splitWidth, TextEditingController controller) {
    var widthOfWidget = 1.0;
    splitWidth ? widthOfWidget = 2.33 : widthOfWidget = 1;
    return Container(
      width: MediaQuery.of(context).size.width / widthOfWidget,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.all(7),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration:
            InputDecoration(hintText: placeholder, border: InputBorder.none),
      ),
    );
  }

  Container inputPhoneNumber(
      String placeholder, TextEditingController controller) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.all(7),
      child: TextFormField(
        controller: controller,
        inputFormatters: [phoneNumberMask],
        keyboardType: TextInputType.phone,
        style: const TextStyle(
          fontSize: 20,
        ),
        decoration:
            InputDecoration(hintText: placeholder, border: InputBorder.none),
      ),
    );
  }

  registerUser() async {
    String name = _nameTEC.text;
    String lastName = _lastNameTEC.text;
    String phoneNumber = _phoneNumberTEC.text;
    String city = _cityTEC.text;
    String province = _provinceTEC.text;

    var postBody = {
      'FirstName': name,
      'LastName': lastName,
      'PhoneNumber': phoneNumber,
      'City': city,
      'Province': province
    };

    var postBodyEncoded = json.encode(postBody);

    var url =
        Uri.parse('https://app-prev-ries.herokuapp.com/api/basicinformation');
    var response = await http.post(url, body: postBodyEncoded, headers: {
      "Accept": "application/json",
      "content-type": "application/json"
    });
  }
}
