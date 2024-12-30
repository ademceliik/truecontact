import 'package:flutter/material.dart';

class ImageWithBorder extends StatelessWidget {
  const ImageWithBorder({
    super.key,
    required this.height,
    required this.width,
    required this.borderWidth,
    required this.imagePath,
    this.margin,
  });

  final double height;
  final double width;
  final double borderWidth;
  final String imagePath;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(
                imagePath,
              )),
          border: Border.all(
              width: borderWidth,
              color: Colors.black,
              style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(60))),
    );
  }
}
