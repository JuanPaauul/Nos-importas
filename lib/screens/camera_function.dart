// ignore_for_file: library_private_types_in_public_api, unused_local_variable, deprecated_member_use, duplicate_ignore, prefer_const_constructors
import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:nos_importas/screens/utils.dart';
import 'package:nos_importas/widget/background_2.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<PickedFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Background(),
        Table(
          children: [
            TableRow(children: [
              Container(
                width: 125,
                height: 125,
              ),
              Container(
                width: 125,
                height: 125,
              ),
            ]),
            TableRow(
              children: [
                TextButton(
                  child: SingleCard(
                    color: Color.fromARGB(255, 0, 121, 36),
                    colorRGBO: Color.fromARGB(45, 0, 121, 36),
                    icon: Icons.camera_alt_outlined,
                    text: '   Tomar foto    ',
                  ),
                  onPressed: () {
                    _openCamera();
                  },
                ),
                TextButton(
                  child: SingleCard(
                    color: Color.fromARGB(255, 0, 17, 255),
                    colorRGBO: Color.fromARGB(45, 0, 17, 255),
                    icon: Icons.videocam_outlined,
                    text: '       Video         ',
                  ),
                  onPressed: () => _openVideo(),
                ),
              ],
            ),
            TableRow(children: [
              TextButton(
                child: SingleCard(
                  color: Color.fromARGB(255, 255, 94, 0),
                  colorRGBO: Color.fromARGB(45, 255, 94, 0),
                  icon: Icons.video_library_outlined,
                  text: '      Galeria       ',
                ),
                onPressed: () {
                  _openGallery();
                },
              ),
              TextButton(
                child: SingleCard(
                  color: Color.fromARGB(255, 184, 33, 243),
                  colorRGBO: Color.fromARGB(45, 184, 33, 243),
                  icon: Icons.call_end_outlined,
                  text: '       Llamada       \n       Telefono',
                ),
                onPressed: () => Utils.openPhoneCall(phoneNumber: '110'),
              ),
            ])
          ],
        ),
      ],
    );
//      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  }

  void _openCamera() {
    ImagePicker picker = ImagePicker();
    final picture = picker.getImage(
      source: ImageSource.camera,
    );
    Navigator.pop(context);
  }

  void _openVideo() {
    ImagePicker picker = ImagePicker();
    // ignore: deprecated_member_use
    final picture = picker.getVideo(
      source: ImageSource.camera,
    );
    Navigator.pop(context);
  }

  void _openGallery() {
    ImagePicker picker = ImagePicker();
    // ignore: deprecated_member_use
    final picture = picker.getImage(
      source: ImageSource.gallery,
    );
    Navigator.pop(context);
  }
}

class SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final Color colorRGBO;

  const SingleCard({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
    required this.colorRGBO,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
                color: colorRGBO,
                //color: Color.fromRGBO(62, 66, 107, 0.15),
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(
                    icon,
                    size: 60,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  radius: 50,
                ),
                SizedBox(
                  height: 10,
                  width: 30,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontSize: 25,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
