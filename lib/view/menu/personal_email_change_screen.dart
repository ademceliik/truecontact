import 'dart:async';
import 'package:calisma_app_1/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../widget/pink_elevated_button.dart';

class PersonalEmailChangeScreen extends StatefulWidget {
  const PersonalEmailChangeScreen({super.key});

  @override
  State<PersonalEmailChangeScreen> createState() =>
      _PersonalEmailChangeScreenState();
}

class _PersonalEmailChangeScreenState extends State<PersonalEmailChangeScreen> {
  bool isButtonDisabled = false;
  bool isCodeSent = false;
  int _start = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            isButtonDisabled = false;
            timer.cancel();
            _start = 10;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(height: 1.h),
          Text(
              style: TextStyle(
                fontSize: 17.sp,
              ),
              "E-Postanızı değiştirmek için lütfen kayıtlı E-Postanızı doğrulayınız:"),
          SizedBox(height: 1.h),
          CustomTextField(
            onChanged: (text) {},
            hintText: "E-posta",
            icon: Icons.email_outlined,
            suffix: TextButton(
              style:
                  TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
              onPressed: isButtonDisabled
                  ? null
                  : () {
                      startTimer();
                      setState(() {
                        isCodeSent = true;
                        isButtonDisabled = true;
                      });
                    },
              child: Text(isButtonDisabled
                  ? "0:${_start < 10 ? "0$_start" : "$_start"}"
                  : isCodeSent
                      ? "Yeni Kod Gönder"
                      : "Kod Gönder"),
            ),
          ),
          SizedBox(height: 1.h),
          CustomTextField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              enabled: isCodeSent,
              onChanged: (text) {},
              hintText: "Doğrulama Kodu",
              icon: Icons.gpp_good_outlined),
          SizedBox(height: 1.h),
          Align(
            alignment: Alignment.topRight,
            child: PinkElevatedButton(
              condition: true,
              text: "Doğrula",
              onPress: () {},
            ),
          )
        ],
      ),
    );
  }
}
