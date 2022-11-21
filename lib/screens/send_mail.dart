import 'package:flutter/material.dart';
import 'package:nos_importas/screens/utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Url Launcher';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: SendEmail(title: title),
      );
}

class SendEmail extends StatefulWidget {
  final String title;

  const SendEmail({
    super.key,
    required this.title,
  });

  @override
  _SendEmailState createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          //title: const Text(' Correo Electronico '),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(
                text: 'Enviar Correo',
                onClicked: () => Utils.openEmail(
                  // Si son mas de 2 correos separar con ',' dentro la cadena.
                  toEmail: 'ciudadcochabamba1@gmail.com',
                  subject: 'ALERTA DE AUXLIO',
                  body: 'Necesito ayuda, porfavor estoy en apuros !.',
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildButton({
    required String text,
    required VoidCallback onClicked,
  }) =>
      Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: ElevatedButton.icon(
          onPressed: onClicked,
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
      );
}
