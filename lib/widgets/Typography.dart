import 'package:flutter/material.dart';

class TimeText extends StatelessWidget {
  final String text;

  const TimeText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        letterSpacing: 0,
      ).apply(
        color: Colors.white
            .withAlpha(128), // Set the alpha value to 128 (50% opacity)
      ),
    );
  }
}
