import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagen extends StatefulWidget {
  _ImagenState createState() => _ImagenState();
}

class _ImagenState extends State<Imagen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cámara con Flutter.'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('EMERGENCIA'),
          onPressed: _optionsDialogBox,
        ),
      ),
    );
  }

  void _openCamera() {
    ImagePicker picker = ImagePicker();
    // ignore: deprecated_member_use
    final picture = picker.getImage(
      source: ImageSource.camera,
    );
  }

  void _openGallery() {
    ImagePicker picker = ImagePicker();
    // ignore: deprecated_member_use
    final picture = picker.getImage(
      source: ImageSource.gallery,
    );
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
                    padding: EdgeInsets.all(8.0),
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
