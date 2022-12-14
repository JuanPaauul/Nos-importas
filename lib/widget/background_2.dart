import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  // ignore: unnecessary_const
  static const boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.2, 12],
          colors: [Color(0xFFFFFFFF), Color.fromARGB(255, 137, 228, 255)]));
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //white gradiant
        Container(
          decoration: boxDecoration,
        ),
        //blue box
        Positioned(top: -180, left: 80, child: BlueBox()),
        Positioned(top: 565, left: -88, child: BlueBox()),
        Positioned(top: 510, left: 240, child: CircleBox()),
        Positioned(top: 260, left: 67, child: BlueBox_1()),
      ],
    );
  }
}

// ignore: camel_case_types
class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 204, 235, 255),
              Color.fromARGB(255, 32, 192, 255),
            ])),
      ),
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
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 32, 192, 255),
              Color.fromARGB(255, 162, 218, 255),
            ])),
      ),
    );
  }
}

class BlueBox_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: -pi / 4.8,
        child: Container(
          width: 210,
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const RadialGradient(
              colors: [
                Color.fromARGB(255, 168, 220, 255),
                Color.fromARGB(255, 32, 192, 255),
              ],
              radius: 1.00,
            ),
          ),
        ));
  }
}
