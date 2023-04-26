import 'package:flutter/material.dart';
import 'package:pictweak/models/text_info.dart';

class ImageText extends StatelessWidget {
  final TextInfo textInfo;
  const ImageText({super.key, required this.textInfo});

  @override
  Widget build(BuildContext context) {
    return Text(
      textInfo.text,
      style: TextStyle(
        fontStyle: textInfo.fontStyle,
        fontWeight: textInfo.fontWeight,
        color: textInfo.color,
        fontSize: textInfo.fontSize,
      ),
    );
  }
}
