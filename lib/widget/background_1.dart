import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Background_1 extends StatelessWidget {
  // ignore: unnecessary_const
  static const boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 10],
          colors: [Color(0xFFFFFFFF), Color.fromARGB(255, 137, 228, 255)]));
  const Background_1({super.key});

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
              Color.fromARGB(255, 32, 192, 255),
              Color.fromARGB(255, 162, 218, 255),
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
              Color.fromARGB(255, 32, 192, 255),
              Color.fromARGB(255, 162, 218, 255),
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
              Color.fromARGB(255, 78, 205, 255),
              Color.fromARGB(255, 180, 225, 255),
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
              Color.fromARGB(255, 106, 213, 255),
              Color.fromARGB(255, 196, 232, 255),
            ])),
      ),
    );
  }
}
