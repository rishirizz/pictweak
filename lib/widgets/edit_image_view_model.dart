import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pictweak/models/text_info.dart';
import 'package:pictweak/widgets/button.dart';
import 'package:screenshot/screenshot.dart';

import '../screens/image_editing_screen.dart';
import '../utils/utils.dart';

abstract class EditImageViewModel extends State<ImageEditingScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();
  int currentIndex = 0;
  bool isBold = false;
  bool isItalic = false;
  List<TextInfo> texts = [];
  Color mycolor = Colors.black;

  saveToGallery(BuildContext context) {
    if (texts.isNotEmpty) {
      screenshotController.capture().then((Uint8List? image) {
        saveImage(image!);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Image saved to the gallery.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
      }).catchError((e) {
        debugPrint('$e');
      });
    }
  }

  saveImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_ $time';
    await requestPermission(Permission.storage);
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  setCurrentIndex(BuildContext context, int index) {
    setState(() {
      currentIndex = index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Text selected for styling.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  changeTextColor(Color color) {
    setState(() {
      texts[currentIndex].color = color;
    });
  }

  increaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize += 2;
    });
  }

  decreaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize -= 2;
    });
  }

  alignLeft() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  alignCenter() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  alignRight() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  boldText() {
    setState(() {
      texts[currentIndex].fontWeight =
          (isBold) ? FontWeight.bold : FontWeight.normal;
    });
  }

  italiciseText() {
    setState(() {
      texts[currentIndex].fontStyle =
          (isItalic) ? FontStyle.italic : FontStyle.normal;
    });
  }

  addLinesToText() {
    setState(() {
      if (texts[currentIndex].text.contains('\n')) {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll('\n', ' ');
      } else {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll(' ', '\n');
      }
    });
  }

  deleteSelectedText(BuildContext context) {
    setState(() {
      texts.removeAt(currentIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Selected text has been removed successfully.',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  addNewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add a new Text'),
          content: TextField(
            controller: textEditingController,
            maxLines: 5,
            decoration: const InputDecoration(
              filled: true,
              suffixIcon: Icon(Icons.edit),
              hintText: 'Your text here.',
            ),
          ),
          actions: [
            AppButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
              textColor: Colors.black,
              child: const Text('Back'),
            ),
            AppButton(
              onPressed: () {
                addNewText(context);
              },
              color: Colors.white,
              textColor: Colors.black,
              child: const Text('Add Text'),
            ),
          ],
        );
      },
    );
  }

  addNewText(BuildContext context) {
    setState(() {
      texts.add(
        TextInfo(
          text: textEditingController.text,
          left: 0,
          top: 0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
          fontSize: 20,
          textAlign: TextAlign.left,
        ),
      );
      Navigator.pop(context);
    });
  }
}
