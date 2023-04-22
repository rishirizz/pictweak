import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final Color textColor;

  const AppButton(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.color,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        textStyle: TextStyle(
          color: textColor,
        ),
      ),
      child: child,
    );
  }
}
