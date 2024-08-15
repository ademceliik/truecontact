import 'package:flutter/material.dart';

class PinkElevatedButton extends StatelessWidget {
  const PinkElevatedButton(
      {super.key,
      required this.text,
      required this.onPress,
      required this.condition});

  final String text;
  final Function()? onPress;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          disabledBackgroundColor: Colors.pink.shade100),
      onPressed: (condition) ? onPress : null,
      child: Text(
        text,
        style: TextStyle(color: (condition) ? Colors.white : Colors.white54),
      ),
    );
  }
}
