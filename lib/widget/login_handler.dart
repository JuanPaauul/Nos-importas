import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nos_importas/screens/app_screen.dart';

import '../models/user_model.dart';

class LoginHandler extends StatelessWidget {
  const LoginHandler({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    bool hasData = false;
    Future<UserModel> user_data;
    Future<UserModel> getUserData() async {
      final response = await http.get(Uri.parse(
          "https://app-prev-ries.herokuapp.com/api/userinformation/uid/${user.uid}"));
      if (response.statusCode == 200) {
        hasData = true;
        String body = utf8.decode(response.bodyBytes);
        final jsonBody = jsonDecode(body);
        UserModel userModel = UserModel(
          jsonBody.uid,
          jsonBody.displayName,
          jsonBody.email,
          jsonBody.phoneNumber,
          jsonBody.province,
          jsonBody.city,
        );
        return userModel;
      } else {
        throw Exception("something happened");
      }
    }

    user_data = getUserData();
    print(user_data);

    if (hasData) {
      return const AppPage();
    }
    return const Scaffold();
  }
}
