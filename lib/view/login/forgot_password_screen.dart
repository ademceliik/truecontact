import 'package:calisma_app_1/view/login/new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/loading_pop_scope.dart';
import '../../widget/pink_elevated_button.dart';

class ForgotPasswordScreenView extends StatefulWidget {
  const ForgotPasswordScreenView({super.key});

  @override
  State<ForgotPasswordScreenView> createState() =>
      _ForgotPasswordScreenViewState();
}

class _ForgotPasswordScreenViewState extends State<ForgotPasswordScreenView> {
  bool emailValidate = false;
  TextEditingController controller = TextEditingController();
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
                  "Doğrulama Kodu Almak İçin E-Posta'nızı Giriniz:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                CustomTextField(
                  controller: controller,
                  hintText: "E-Posta",
                  icon: Icons.email,
                  onChanged: (value) {
                    setState(() {
                      emailValidate = RegExp(r'^\S+@\S+$').hasMatch(value);
                    });
                  },
                ),
                SizedBox(height: 3.h),
                Align(
                  alignment: Alignment.topRight,
                  child: PinkElevatedButton(
                    condition: true, //emailValidate,
                    text: "Kod Gönder",
                    onPress: () {
                      /*   showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return LoadingPopScope();
                        },
                      );
                      Future.delayed(
                        Duration(seconds: 3),
                        () {
                          if (mounted) {
                            Navigator.pop(context);
                          }
                        },
                      ); */
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewPasswordScreenView(
                                email: controller.text)), //HomeTabbarView()),
                      );

                      print(controller.text);
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
