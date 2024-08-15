import 'package:calisma_app_1/provider/register_screen_provider.dart';
import 'package:calisma_app_1/view/login/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../provider/login_screen_provider.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/pink_elevated_button.dart';
import 'forgot_password_screen.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  bool emailValidate = false;
  bool passwordValidate = false;
  @override
  Widget build(BuildContext context) {
    LoginScreenProvider loginScreenProvider =
        Provider.of<LoginScreenProvider>(context);
    return Padding(
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
              Row(children: [
                Text(
                  "Hey!",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  " True Contact",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ]),
              Text(
                "Bilgilerini gir ve giriş yap",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomTextField(
                hintText: "E-Posta",
                icon: Icons.email,
                onChanged: (value) {
                  loginScreenProvider.setEmail(value);
                  emailValidate = RegExp(r'^\S+@\S+$').hasMatch(value);
                },
              ),
              SizedBox(height: 3.h),
              CustomTextField(
                hintText: "Şifre",
                icon: Icons.lock,
                isObscure: loginScreenProvider.isObscure,
                suffix: InkWell(
                  onTap: () {
                    Provider.of<LoginScreenProvider>(context, listen: false)
                        .setIsObscure();
                  },
                  child: Icon(loginScreenProvider.isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
                ),
                onChanged: (value) {
                  loginScreenProvider.setPassword(value);
                  passwordValidate = (value.length > 7);
                },
              ),
              SizedBox(height: 3.h),
              Align(
                alignment: Alignment.topRight,
                child: PinkElevatedButton(
                  condition: emailValidate && passwordValidate,
                  text: "Oturum Aç",
                  onPress: () {
                    print(loginScreenProvider.user.email);
                    print(loginScreenProvider.user.password);
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 3.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ChangeNotifierProvider<RegisterScreenProvider>(
                                create: (context) => RegisterScreenProvider(),
                                child:
                                    RegisterScreenView())), //HomeTabbarView()),
                  );
                },
                child: Text(
                  "Henüz üye değil misiniz?\nKayıt Ol!",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                )),
            TextButton(
                style:
                    TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ForgotPasswordScreenView()), //HomeTabbarView()),
                  );
                },
                child: Text(
                  "Parolanızı mı\n unuttunuz?",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ))
          ]),
        )
      ]),
    );
  }
}
