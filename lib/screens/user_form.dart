import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
            "https://cdn-icons-png.flaticon.com/512/1141/1141078.png"),
        const SizedBox(
          height: 20,
        ),
        _FormName(),
        SizedBox(
          height: 10,
        ),
        _FormGmail()
      ],
    );
  }

  Container _FormName() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(border: InputBorder.none),
        ));
  }

  Container _FormGmail() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(border: InputBorder.none),
        ));
  }
}
