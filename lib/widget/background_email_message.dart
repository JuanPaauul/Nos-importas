import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Background_email_message extends StatelessWidget {
  // ignore: unnecessary_const
  static const boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.15, 10],
          colors: [Color(0xFFFFFFFF), Color.fromARGB(255, 222, 137, 255)]));
  const Background_email_message({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //white gradiant
        Container(
          decoration: boxDecoration,
        ),
        //blue box
        Positioned(top: 300, right: 40, child: CircleBox_3()),
        Positioned(top: 460, left: 50, child: CircleBox_3()),
        Positioned(top: 400, right: 65, child: CircleBox_2()),
        Positioned(top: 565, left: -88, child: CircleBox_1()),
        Positioned(top: 510, left: 240, child: CircleBox()),
      ],
    );
  }
}

class CircleBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3,
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const RadialGradient(colors: [
              Color.fromARGB(255, 166, 32, 255),
              Color.fromARGB(255, 218, 162, 255),
            ])),
      ),
    );
  }
}

class CircleBox_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const RadialGradient(colors: [
              Color.fromARGB(255, 184, 32, 255),
              Color.fromARGB(255, 229, 162, 255),
            ])),
      ),
    );
  }
}

class CircleBox_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const RadialGradient(colors: [
              Color.fromARGB(255, 190, 78, 255),
              Color.fromARGB(255, 228, 180, 255),
            ])),
      ),
    );
  }
}

class CircleBox_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const RadialGradient(colors: [
              Color.fromARGB(255, 200, 106, 255),
              Color.fromARGB(255, 238, 196, 255),
            ])),
      ),
    );
  }
}
