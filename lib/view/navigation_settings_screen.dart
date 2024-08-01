import 'package:calisma_app_1/widget/my_appbar.dart';
import 'package:calisma_app_1/widget/pink_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NavigationSettingScreen extends StatefulWidget {
  const NavigationSettingScreen({super.key});

  @override
  State<NavigationSettingScreen> createState() =>
      _NavigationSettingScreenState();
}

class _NavigationSettingScreenState extends State<NavigationSettingScreen> {
  int? secilenRadio;
  List<String> navigationList = ["Kapalı", "Sabit Konum", "Canlı Konum"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/logo/header-logo.png")),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.done_rounded,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text("Konum Ayarı",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500)),
          ),
          Divider(
            indent: 1.h,
            endIndent: 1.h,
            color: Colors.black.withOpacity(0.2),
          ),
          Column(
              children:
                  List<Widget>.generate(navigationList.length, (int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio<int>(
                  value: index,
                  groupValue: secilenRadio,
                  onChanged: (value) {
                    setState(() {
                      secilenRadio = value!;
                    });
                  },
                  activeColor: Colors.red,
                ),
                Text(navigationList[index]),
              ],
            );
          })),
          secilenRadio == 1
              ? PinkElevatedButton(
                  text: "Haritada Bir Konum Seçin",
                  onPress: () {},
                  condition: true)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
