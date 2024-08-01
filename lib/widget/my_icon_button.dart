import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });

  final IconData iconData;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          fixedSize: Size(7.h, 7.h),
          shape: const CircleBorder(
              side: BorderSide(color: Colors.orangeAccent, width: 1))),
      icon: Icon(iconData, color: Colors.orangeAccent),
      onPressed: onPressed,
    );
  }
}
