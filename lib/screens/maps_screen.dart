import 'package:flutter/material.dart';
import 'package:nos_importas/functions/input_file.dart';
import 'package:nos_importas/screens/app_screen.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Mapas",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    const Text(
                      "Mapa Seguro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Image.asset(
                      'assets/mapa.png',
                      width: 450.0,
                    ),
                    const Text(
                      "Mapas Inseguro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Image.asset(
                      'assets/mapa.png',
                      width: 450.0,
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
