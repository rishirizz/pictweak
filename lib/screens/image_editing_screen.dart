import 'dart:io';

import 'package:flutter/material.dart';

import '../widgets/edit_image_view_model.dart';
import '../widgets/image_text.dart';

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
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          // width: double.infinity,
          child: Stack(
            children: [
              Image.file(
                File(
                  widget.selectedImagePath,
                ),
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              for (int i = 0; i < texts.length; i++)
                Positioned(
                  left: texts[i].left,
                  top: texts[i].top,
                  child: GestureDetector(
                    onLongPress: () {},
                    onTap: () {},
                    child: Draggable(
                      feedback: ImageText(
                        textInfo: texts[i],
                      ),
                      child: ImageText(
                        textInfo: texts[i],
                      ),
                      onDragEnd: (drag) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        Offset offset = renderBox.globalToLocal(drag.offset);
                        setState(() {
                          texts[i].top = offset.dy;
                          texts[i].left = offset.dx;
                        });
                      },
                    ),
                  ),
                ),
              creatorController.text.isNotEmpty
                  ? Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        creatorController.text,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
