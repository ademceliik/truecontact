import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    this.onChanged,
    this.isObscure = false,
    this.suffix,
    this.readOnly = false,
    this.onTap,
    this.controller,
    this.enabled,
    this.keyboardType,
  });

  final String hintText;
  final IconData icon;
  final bool isObscure;
  final Widget? suffix;
  final Function(String)? onChanged;
  final bool readOnly;
  final bool? enabled;
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade200),
        child: TextField(
          keyboardType: keyboardType,
          enabled: enabled,
          controller: controller,
          onTap: onTap,
          readOnly: readOnly,
          onChanged: onChanged,
          obscureText: isObscure,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            border: InputBorder.none,
            suffix: suffix,
            hintText: hintText,
          ),
        ));
  }
}
