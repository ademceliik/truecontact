import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(child: Image.asset("assets/logo/header-logo.png")),
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded), onPressed: () {}),
      actions: [
        IconButton(
            icon: Icon(
              Icons.done_rounded,
              color: Colors.red,
            ),
            onPressed: () {})
      ],
    );
  }
}
