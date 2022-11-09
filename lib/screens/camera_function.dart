import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagen extends StatefulWidget {
  _ImagenState createState() => _ImagenState();
}

class _ImagenState extends State<Imagen> {
  List<PickedFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cámara'),
        ),
        body: Center(
            child: ElevatedButton.icon(
          onPressed: _optionsDialogBox,
          style: TextButton.styleFrom(
              primary: Colors.redAccent, backgroundColor: Colors.red),
          label: Text(
            'EMERGENCIA',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                fontStyle: FontStyle.italic,
                color: Colors.black),
          ),
          icon: Icon(
            Icons.warning,
            size: 100,
            color: Colors.yellowAccent,
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
                    child: Text('Tomar fotografia'),
                    onTap: _openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  GestureDetector(
                    child: Text('Tomar video'),
                    onTap: _openVideo,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  GestureDetector(
                    child: Text('Seleccionar de galeria'),
                    onTap: _openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
