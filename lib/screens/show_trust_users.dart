import 'package:flutter/material.dart';
import '../widget/trust_users_list.dart';
import '../widget/user_form_widget.dart';

class ShowTrustUsersForm extends StatefulWidget {
  const ShowTrustUsersForm({super.key});

  @override
  _ShowTrustUserState createState() => _ShowTrustUserState();
}

class _ShowTrustUserState extends State<ShowTrustUsersForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const TrustUserListWidget(),
          ElevatedButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserFormWidget()));
              }),
              child: const Text("Añadir usuario de confianza"))
        ],
      ),
    );
    //return const UserFormWidget();
  }
}
