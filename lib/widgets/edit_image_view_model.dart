import 'package:flutter/material.dart';
import 'package:pictweak/widgets/button.dart';

import '../screens/image_editing_screen.dart';

abstract class EditImageViewModel extends State<ImageEditingScreen> {
  TextEditingController textEditingController = TextEditingController();
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
                // Navigator.pop(context);
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
}
