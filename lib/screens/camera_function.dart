// ignore_for_file: library_private_types_in_public_api, unused_local_variable, deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nos_importas/widget/background.dart';
import 'package:nos_importas/widget/background_1.dart';

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
        child: Stack(
          children: [
            Background_1(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  child: ElevatedButton.icon(
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                    label: const Text(
                      'Tomar Fotografia',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.camera,
                      size: 40,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _openCamera();
                    },
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: ElevatedButton.icon(
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                    label: const Text(
                      'Tomar Video',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.video_call,
                      size: 40,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _openVideo();
                    },
                  ),
                  onPressed: () {},
                ),
                TextButton(
                  child: ElevatedButton.icon(
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                    label: const Text(
                      'Seleccionar de Galeria',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.photo_album,
                      size: 40,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _openGallery();
                    },
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
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
