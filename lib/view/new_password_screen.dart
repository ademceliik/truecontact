import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widget/custom_text_field.dart';
import '../widget/pink_elevated_button.dart';

class NewPasswordScreenView extends StatefulWidget {
  final String email;
  const NewPasswordScreenView({super.key, required this.email});

  @override
  State<NewPasswordScreenView> createState() => _NewPasswordScreenViewState();
}

class _NewPasswordScreenViewState extends State<NewPasswordScreenView> {
  bool codeValidate = false;
  bool passwordValidate = false;
  bool isObscure = true;
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top,
            bottom: MediaQuery.of(context).viewPadding.bottom),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 25.h,
            child: Center(child: Image.asset("assets/logo/logo.png")),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Doğrulama Kodunu ve Yeni Şifreyi Giriniz:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  controller: codeController,
                  hintText: "Doğrulama Kodu",
                  icon: Icons.key_outlined,
                  onChanged: (value) {
                    setState(() {
                      codeValidate = codeController.text.length == 4;
                    });
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  hintText: "Şifre",
                  icon: Icons.lock,
                  isObscure: isObscure,
                  suffix: InkWell(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: Icon(isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                  onChanged: (value) {
                    setState(() {
                      passwordValidate = (value.length > 7);
                    });
                  },
                ),
                SizedBox(height: 3.h),
                Align(
                  alignment: Alignment.topRight,
                  child: PinkElevatedButton(
                    condition: codeValidate && passwordValidate,
                    text: "Şifreyi Değiştir",
                    onPress: () {
                      Navigator.pop(context);
                      print(codeController.text + passwordController.text);
                    },
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 3.h),
        ]),
      ),
    );
  }
}
