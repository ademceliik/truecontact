import 'package:calisma_app_1/view/menu/personal_photos_screen.dart';
import 'package:calisma_app_1/widget/my_appbar.dart';
import 'package:calisma_app_1/widget/pink_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'personal_info_screen.dart';

class AccountDetailsScreen extends StatefulWidget {
  const AccountDetailsScreen({super.key});

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    PersonalInfoScreen(), //Container(child: Text("1. sayfa")),
    PersonalPhotosScreen(),
    Container(child: Text("3. sayfa")),
    Container(child: Text("4. sayfa")),
    Container(child: Text("5. sayfa")),
    Container(child: Text("6. sayfa")),
  ];
  List<String> titles = [
    "Kişisel Bilgi",
    "Fotoğraflar",
    "Sosyal Hesaplar",
    "Adreslerim",
    "E-posta Değiştir",
    "Şifre Değiştir"
  ];
  List<IconData> icons = [
    Icons.person,
    Icons.photo,
    Icons.share,
    Icons.home,
    Icons.mail,
    Icons.lock
  ];

  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
    5: GlobalKey<NavigatorState>(),
    6: GlobalKey<NavigatorState>(),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Image.asset("assets/logo/header-logo.png")),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                setState(() {
                  currentIndex == 0 ? Navigator.pop(context) : currentIndex = 0;
                });
              }),
        ),
        body: currentIndex != 0
            ? pages[currentIndex - 1]
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(titles.length, (int index) {
                  return buildItem(index);
                }),
              ));
  }

  Widget buildItem(int index) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const BeveledRectangleBorder()),
        onPressed: () {
          setState(() {});
          currentIndex = index + 1;
          Navigator(
            key: navigatorKeys[index],
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(builder: (_) => pages.elementAt(index));
            },
          );
        },
        child: Row(
          children: [
            SizedBox(width: 5.w),
            Icon(
              icons[index],
              color: Colors.pink,
            ),
            SizedBox(width: 3.w),
            Text(titles[index],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                ))
          ],
        ));
  }
}
