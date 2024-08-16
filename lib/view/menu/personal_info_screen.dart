import 'package:calisma_app_1/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/pink_elevated_button.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  void _showPicker(context, Widget child) {
    showCupertinoModalPopup(
      barrierDismissible: false,
      context: context,
      builder: (_) => Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: child,
        ),
      ),
    );
  }

  TextEditingController birthdayController = TextEditingController();
  TextEditingController genderOrWorkController = TextEditingController();
  List<String> textList = ["Erkek", "Kadın", "Belirtmek İstemiyorum"];
  int _pickerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              height: 15.h,
              width: 15.h,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        "assets/logo/logo.png",
                      )),
                  border: Border.all(
                      width: 2.w,
                      color: Colors.black,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(60))),
            ),
          ),
          SizedBox(height: 1.h),
          CustomTextField(
              onChanged: (text) {},
              hintText: "İsim",
              icon: Icons.person_outline),
          SizedBox(height: 1.h),
          CustomTextField(
              onChanged: (text) {},
              hintText: "Hakkında",
              icon: Icons.info_outline),
          SizedBox(height: 1.h),
          CustomTextField(
            onChanged: (text) {},
            hintText: "Telefon Numarası",
            icon: Icons.phone_android_outlined,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 1.h),
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
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (value) {
                          // Update users birthday
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
            },
          ),
          SizedBox(height: 1.h),
          CustomTextField(
            onTap: () => _showPicker(
                context,
                Column(
                  children: [
                    TextButton(
                      child: const Text("Seç"),
                      onPressed: () {
                        genderOrWorkController.text = textList[_pickerIndex];
                        // Update users gender
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
                              //Update users gender
                            },
                            children: textList.map((e) => Text(e)).toList())),
                  ],
                )),
            readOnly: true,
            controller: genderOrWorkController,
            hintText: "Cinsiyet",
            icon: Icons.male,
            onChanged: (value) {
              // Update users gender
            },
          ),
          SizedBox(height: 1.h),
          Align(
            alignment: Alignment.topRight,
            child: PinkElevatedButton(
              condition: true,
              text: "Kaydet",
              onPress: () {
                // Save user personal info logics
              },
            ),
          )
        ],
      ),
    );
  }
}
