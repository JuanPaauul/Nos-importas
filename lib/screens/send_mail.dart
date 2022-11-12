// ignore_for_file: non_constant_identifier_names, deprecated_member_use, unused_import, library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'dart:io';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:nos_importas/screens/button_emergency_screen.dart';
import 'package:toast/toast.dart';

class SendMailFromLocalHost extends StatefulWidget {
  const SendMailFromLocalHost({super.key});

  @override
  _SendMailFromLocalHostState createState() => _SendMailFromLocalHostState();
}

class _SendMailFromLocalHostState extends State<SendMailFromLocalHost>
    with SingleTickerProviderStateMixin {
  SendMail() async {
    String username = "ciudadcochabamba1@gmail.com";
    String password = "nosimportas2022";

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username)
      ..recipients.add('ciudadcochabamba1@gmail.com')
      //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      //..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Test Dart Mailer library :: 😀 :: ${DateTime.now()}'
      //..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>!!! AUXILIO PORFAVOR !!!</h1>\n<p>Hey! Here's some HTML content</p>";

    try {
      final sendReport = await send(message, smtpServer);
      showToast('Message Send Check your mail',
          gravity: Toast.center, duration: 3);
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Correo Electronico '),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            sendEmail();
          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.purple, backgroundColor: Colors.purple),
          label: const Text(
            "Enviar Correo",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
          icon: const Icon(
            Icons.send,
            size: 40,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, textStyle: context, duration: duration, gravity: gravity);
  }
}
