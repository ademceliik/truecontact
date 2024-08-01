import 'package:flutter/material.dart';

class MapNavbarItem extends StatelessWidget {
  const MapNavbarItem({
    super.key,
    this.onTap,
    required this.icon,
    required this.text,
  });

  final Function()? onTap;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [icon, Text(text)],
      ),
    );
  }
}
