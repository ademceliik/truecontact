import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/custom_text_field.dart';
import '../../widget/pink_elevated_button.dart';

class PersonalPasswordChangeScreen extends StatefulWidget {
  final String email;
  const PersonalPasswordChangeScreen({super.key, required this.email});

  @override
  State<PersonalPasswordChangeScreen> createState() =>
      _PersonalPasswordChangeScreenState();
}

class _PersonalPasswordChangeScreenState
    extends State<PersonalPasswordChangeScreen> {
  bool newPasswordValidate = false;
  bool oldPasswordValidate = false;
  bool isObscureOld = true;
  bool isObscureNew = true;

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Şifre Güncelleme",
              style: TextStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          CustomTextField(
            controller: oldPasswordController,
            hintText: "Mevcut Şifre",
            icon: Icons.lock,
            isObscure: isObscureOld,
            suffix: InkWell(
              onTap: () {
                setState(() {
                  isObscureOld = !isObscureOld;
                });
              },
              child: Icon(isObscureOld
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
            ),
            onChanged: (value) {
              setState(() {
                newPasswordValidate = (value.length >= 7);
              });
            },
          ),
          SizedBox(height: 3.h),
          CustomTextField(
            controller: newPasswordController,
            hintText: "Yeni Şifre",
            icon: Icons.lock,
            isObscure: isObscureNew,
            suffix: InkWell(
              onTap: () {
                setState(() {
                  isObscureNew = !isObscureNew;
                });
              },
              child: Icon(isObscureNew
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
            ),
            onChanged: (value) {
              setState(() {
                oldPasswordValidate = (value.length >= 7);
              });
            },
          ),
          SizedBox(height: 3.h),
          Align(
            alignment: Alignment.topRight,
            child: PinkElevatedButton(
              condition: newPasswordValidate && oldPasswordValidate,
              text: "Şifreyi Güncelle",
              onPress: () {
                //Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
