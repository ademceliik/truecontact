import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../provider/register_screen_provider.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/pink_elevated_button.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({super.key});

  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
/*   bool radioValidate = false;
  bool nameValidate = false;
  bool emailValidate = false;
  bool passwordValidate = false;
  bool birthdayValidate = false;
  bool selectionValidate = false; */
  int _pickerIndex = 0;
  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderOrWorkController = TextEditingController();

  List<String> textList = [];

  void _showPicker(ctx, Widget child) {
    showCupertinoModalPopup(
      barrierDismissible: false,
      context: ctx,
      builder: (_) => Container(
        height: 270,
        color: Colors.white,
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RegisterScreenProvider registerScreenProvider =
        Provider.of<RegisterScreenProvider>(context);

    radioChanged(int? value) {
      //registerScreenProvider.checkList[0] = true;
      //radioValidate = true;
      genderOrWorkController = TextEditingController();
      registerScreenProvider.setRadioIndex(value!);
      textList = value == 0
          ? registerScreenProvider.genderList
          : registerScreenProvider.workList;
    }

    int? secilenRadio = registerScreenProvider.user.accountType;

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
                  "Kayıt Ol",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<int>(
                          value: 0,
                          groupValue: secilenRadio,
                          onChanged: radioChanged,
                          activeColor: Colors.red,
                        ),
                        const Text("Bireysel"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<int>(
                          value: 1,
                          groupValue: secilenRadio,
                          onChanged: radioChanged,
                          activeColor: Colors.green,
                        ),
                        const Text("Kurumsal"),
                      ],
                    ),
                  ],
                ),
                CustomTextField(
                  hintText: "Ad Soyad",
                  icon: Icons.person,
                  onChanged: (value) {
                    registerScreenProvider.setName(value);
                    //registerScreenProvider.checkList[1] = value.length > 3;
                    //emailValidate = value.length > 3;
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  hintText: "E-Posta",
                  icon: Icons.email,
                  onChanged: (value) {
                    registerScreenProvider.setEmail(value);
                    //  registerScreenProvider.checkList[2] =
                    //      RegExp(r'^\S+@\S+$').hasMatch(value);
                    //emailValidate = RegExp(r'^\S+@\S+$').hasMatch(value);
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  hintText: "Şifre",
                  icon: Icons.lock,
                  isObscure: registerScreenProvider.isObscure,
                  suffix: InkWell(
                    onTap: () {
                      registerScreenProvider.setIsObscure();
                    },
                    child: Icon(registerScreenProvider.isObscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  ),
                  onChanged: (value) {
                    registerScreenProvider.setPassword(value);
                    //registerScreenProvider.checkList[3] = value.length > 7;
                    //passwordValidate = (value.length > 7);
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  controller: birthdayController,
                  onTap: () => _showPicker(
                      context,
                      Column(
                        children: [
                          TextButton(
                            child: const Text("Kapat"),
                            onPressed: () => Navigator.maybePop(context),
                          ),
                          SizedBox(
                            height: 250,
                            child: CupertinoDatePicker(
                              minimumYear: DateTime.now().year - 150,
                              maximumYear: DateTime.now().year,
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: registerScreenProvider
                                  .user.birthday, //DateTime.now(),
                              onDateTimeChanged: (value) {
                                registerScreenProvider.setBirthday(value);
                                birthdayController.text =
                                    '${value.day.toString().padLeft(2, '0')}/'
                                    '${value.month.toString().padLeft(2, '0')}/'
                                    '${value.year.toString()}';
                              },
                            ),
                          ),
                        ],
                      )),
                  readOnly: true,
                  hintText: "Doğum Tarihi",
                  icon: Icons.date_range,
                  onChanged: (value) {
                    print("değişti");
                    /*   registerScreenProvider.setBirthday(value);
                    emailValidate = value.length > 3; */
                  },
                ),
                SizedBox(height: 3.h),
                CustomTextField(
                  onTap: () => _showPicker(
                      context,
                      Column(
                        children: [
                          TextButton(
                            child: const Text("Seç"),
                            onPressed: () {
                              genderOrWorkController.text =
                                  textList[_pickerIndex];
                              registerScreenProvider
                                  .setPickerIndex(_pickerIndex);
                              Navigator.maybePop(context);
                            },
                          ),
                          SizedBox(
                              height: 250,
                              child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: _pickerIndex),
                                  itemExtent: 30,
                                  onSelectedItemChanged: (value) {
                                    _pickerIndex = value;
                                    //genderOrWorkController.text = textList[value];
                                  },
                                  children:
                                      textList.map((e) => Text(e)).toList())),
                        ],
                      )),
                  enabled: registerScreenProvider.checkList[0],
                  readOnly: true,
                  controller: genderOrWorkController,
                  hintText: secilenRadio == 0 ? "Cinsiyet" : "İş Alanı",
                  icon: secilenRadio == 0 ? Icons.male : Icons.work,
                  onChanged: (value) {
                    /*  registerScreenProvider.setEmail(value);
                    emailValidate = value.length > 3; */
                  },
                ),
                SizedBox(height: 3.h),
                Align(
                  alignment: Alignment.topRight,
                  child: PinkElevatedButton(
                    condition: registerScreenProvider.checkList.every((e) => e),
                    text: "Kayıt Ol",
                    onPress: () {
                      Navigator.pop(context);
                      // print(registerScreenProvider.user.accountType);
                    },
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
