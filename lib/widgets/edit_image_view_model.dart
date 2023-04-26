import 'package:flutter/material.dart';
import 'package:pictweak/models/text_info.dart';
import 'package:pictweak/widgets/button.dart';

import '../screens/image_editing_screen.dart';

abstract class EditImageViewModel extends State<ImageEditingScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorController = TextEditingController();
  int currentIndex = 0;
  bool isBold = false;
  bool isItalic = false;
  List<TextInfo> texts = [];

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
      texts[currentIndex].fontSize -= 2;
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
