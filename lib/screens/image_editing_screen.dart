import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/edit_image_view_model.dart';

class ImageEditingScreen extends StatefulWidget {
  final String selectedImagePath;
  const ImageEditingScreen({required this.selectedImagePath, super.key});

  static const routeName = '/image-edit-screen';

  @override
  State<ImageEditingScreen> createState() => _ImageEditingScreenState();
}

class _ImageEditingScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          tooltip: 'Add New Text',
          onPressed: () {
            addNewDialog(context);
          },
          child: const Icon(
            Icons.edit,
            color: Colors.black,
          ),
        ),
        body: Image.file(
          File(
            widget.selectedImagePath,
          ),
        ),
      ),
    );
  }
}
