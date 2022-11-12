import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:nos_importas/screens/camera_function.dart';

// ignore: must_be_immutable
class PhotoViewScreen extends StatelessWidget {
  PhotoViewScreen({super.key, required this.imageFile});
  File imageFile;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: PhotoView(
        imageProvider: FileImage(imageFile),
      ),
    );
  }
}
