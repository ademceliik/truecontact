import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.leading,
    this.actions,
  });

  final Widget? leading;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/logo/header-logo.png")),
        leading: leading,
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
