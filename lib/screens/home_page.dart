import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:pictweak/screens/image_editing_screen.dart';

import '../textstyles/textstyles.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
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
                  size: 60,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Select an Image from the Gallery.',
                style: headerTextStyle(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
