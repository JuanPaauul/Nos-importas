import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../provider/google_sign_in.dart';

class TrustUserListWidget extends StatefulWidget {
  const TrustUserListWidget({super.key});

  @override
  State<TrustUserListWidget> createState() => _TrustUserListWidgetState();
}

bool longTapped = false;

class _TrustUserListWidgetState extends State<TrustUserListWidget> {
  Padding trustUser(
      String avatarUrl, String userName, String email, bool inDanger) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: InkWell(
        child: Row(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(avatarUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(userName,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(53, 167, 219, 1),
                                fontWeight: FontWeight.bold)),
                        inDanger
                            ? const Icon(
                                Icons.warning,
                                size: 15,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.health_and_safety_outlined,
                                size: 15,
                                color: Colors.lightGreen,
                              ),
                      ],
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 105, 105, 105)),
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Visibility(
              visible: longTapped,
              child: const Icon(
                Icons.group_remove_outlined,
                color: Color.fromARGB(255, 235, 133, 126),
              ),
            )
          ],
        ),
        onLongPress: () => {
          setState(() {
            longTapped = !longTapped;
          })
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            trustUser(
                "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
                "John Wick",
                "john.wick@gmail.com",
                false),
            trustUser(
                "https://media.istockphoto.com/photos/african-woman-making-at-decision-picture-id1056239454?b=1&k=20&m=1056239454&s=170667a&w=0&h=DniPYDMKKNmHUUHNOYeFyaBr6QMW_dnSwkW1aCsnHEY=",
                "Elizabeth Bohn",
                "eliza.beth@hotmail.com",
                false),
            trustUser(
                "https://images.unsplash.com/photo-1580851935978-f6b4e359da3f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG9saGFyfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
                "Nairobi Black",
                "nairobi.black@ucb.edu.bo",
                true),
          ],
        ),
      );
}
