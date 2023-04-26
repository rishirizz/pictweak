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
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(179, 215, 215, 215),
          automaticallyImplyLeading: false,
          title: SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.save,
                    color: Colors.black,
                  ),
                  tooltip: 'Save',
                ),
                IconButton(
                  onPressed: () {
                    increaseFontSize();
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  tooltip: 'Increase font size',
                ),
                IconButton(
                  onPressed: () {
                    decreaseFontSize();
                  },
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                  tooltip: 'Decrease font size',
                ),
                IconButton(
                  onPressed: () {
                    alignLeft();
                  },
                  icon: const Icon(
                    Icons.format_align_left,
                    color: Colors.black,
                  ),
                  tooltip: 'Align Left',
                ),
                IconButton(
                  onPressed: () {
                    alignCenter();
                  },
                  icon: const Icon(
                    Icons.format_align_center,
                    color: Colors.black,
                  ),
                  tooltip: 'Align Center',
                ),
                IconButton(
                  onPressed: () {
                    alignRight();
                  },
                  icon: const Icon(
                    Icons.format_align_right,
                    color: Colors.black,
                  ),
                  tooltip: 'Align Right',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.format_bold,
                    color: Colors.black,
                  ),
                  tooltip: 'Bold',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.format_italic,
                    color: Colors.black,
                  ),
                  tooltip: 'Italic',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.space_bar,
                    color: Colors.black,
                  ),
                  tooltip: 'Add New line',
                ),
                Tooltip(
                  message: 'Red',
                  child: GestureDetector(
                    onTap: () {
                      changeTextColor(Colors.red);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Tooltip(
                  message: 'Black',
                  child: GestureDetector(
                    onTap: () {
                      changeTextColor(Colors.black);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Tooltip(
                  message: 'White',
                  child: GestureDetector(
                    onTap: () {
                      changeTextColor(Colors.white);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Tooltip(
                  message: 'Blue',
                  child: GestureDetector(
                    onTap: () {
                      changeTextColor(Colors.blue);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Tooltip(
                  message: 'Yellow',
                  child: GestureDetector(
                    onTap: () {
                      changeTextColor(Colors.yellow);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.yellow,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Tooltip(
                  message: 'Green',
                  child: GestureDetector(
                    onTap: () {
                      changeTextColor(Colors.green);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Tooltip(
                  message: 'Orange',
                  child: GestureDetector(
                    onTap: () {
                      changeTextColor(Colors.orange);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Tooltip(
                  message: 'Pink',
                  child: GestureDetector(
                    onTap: () {
                      changeTextColor(Colors.pink);
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.pink,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
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
          height: MediaQuery.of(context).size.height * 0.6,
          // width: double.infinity,
          child: Stack(
            children: [
              Image.file(
                File(
                  widget.selectedImagePath,
                ),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              for (int i = 0; i < texts.length; i++)
                Positioned(
                  left: texts[i].left,
                  top: texts[i].top,
                  child: GestureDetector(
                    onLongPress: () {},
                    onTap: () {
                      setCurrentIndex(context, i);
                    },
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
                          texts[i].top = offset.dy - 90;
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
