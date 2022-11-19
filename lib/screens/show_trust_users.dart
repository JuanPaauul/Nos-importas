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
          const TrustUserListWidget(),
          const Spacer(),
          Row(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              SizedBox(
                height: 45.0,
                width: 45.0,
                child: FloatingActionButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserFormWidget()));
                    }),
                    backgroundColor: const Color.fromARGB(255, 101, 183, 221),
                    elevation: 5.0,
                    child: const Icon(Icons.add)),
              )
            ],
          )
        ],
      ),
    );
    //return const UserFormWidget();
  }
}
