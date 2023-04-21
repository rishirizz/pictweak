import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pictweak/screens/image_editing_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagePicker imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: IconButton(
            onPressed: () async {
              await imagePicker
                  .pickImage(
                source: ImageSource.gallery,
              )
                  .then((value) {
                if (value != null) {
                  Navigator.pushNamed(
                    context,
                    ImageEditingScreen.routeName,
                    arguments: value.path,
                  );
                }
              });
            },
            icon: const Icon(
              Icons.upload_file,
            ),
          ),
        ),
      ),
    );
  }
}
