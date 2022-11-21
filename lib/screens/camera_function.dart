// ignore_for_file: unused_import, library_private_types_in_public_api, unused_local_variable, sort_child_properties_last, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nos_importas/screens/camera_screen.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<PickedFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton.icon(
      onPressed: _optionsDialogBox,
      style: TextButton.styleFrom(
          foregroundColor: Colors.redAccent, backgroundColor: Colors.black),
      label: const Text(
        'ABRIR',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 70,
            fontStyle: FontStyle.italic,
            color: Colors.white),
      ),
      icon: const Icon(
        Icons.open_in_browser,
        size: 100,
        color: Colors.blue,
      ),
    )));
  }

  void _openCamera() {
    ImagePicker picker = ImagePicker();
    // ignore: deprecated_member_use
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

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: const Text('Tomar fotografia Simulador'),
                    onTap: _openCamera,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  GestureDetector(
                    child: const Text('Tomar video - Simulador'),
                    onTap: _openVideo,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  GestureDetector(
                    child: const Text('Tomar fotografia Real - IN PROCESS'),
                    onTap: () async {
                      String path = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CameraScreen()));
                      PickedFile pickedFile = PickedFile(path);
                      images.add(pickedFile);
                      Navigator.pop(context);
                      setState(() {});
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(40.0),
                  ),
                  GestureDetector(
                    child: const Text('Seleccionar de galeria'),
                    onTap: _openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
