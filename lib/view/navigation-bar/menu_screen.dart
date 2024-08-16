import 'package:calisma_app_1/view/menu/account_details_screen.dart';
import 'package:calisma_app_1/view/menu/my_orders_screen_view.dart';
import 'package:calisma_app_1/view/navigation_settings_screen.dart';
import 'package:calisma_app_1/view/user_details_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  List<Widget> pages = [
    MyOrdersScreenView(), //Container(child: Text("1. sayfa")),
    Container(child: Text("2. sayfa")),
    AccountDetailsScreen(),
    NavigationSettingScreen(),
    Container(child: Text("5. sayfa")),
    Container(child: Text("6. sayfa")),
    Container(child: Text("7. sayfa")),
    Container(child: Text("8. sayfa")),
    Container(child: Text("9. sayfa")),
  ];
  List<String> titles = [
    "Siparişlerim",
    "Talepler",
    "Hesabı Düzenle",
    "Konum",
    "Dil",
    "Cüzdan",
    "TrueCoin Satın Al",
    "Engellenmiş Kullanıcılar",
    "Çıkış Yap"
  ];
  List<IconData> icons = [
    Icons.shopping_basket,
    Icons.back_hand_rounded,
    Icons.person,
    Icons.map_rounded,
    Icons.language_rounded,
    Icons.wallet,
    Icons.money_rounded,
    Icons.stop_circle_outlined,
    Icons.logout_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              color: Colors.red, height: MediaQuery.of(context).padding.top),
          Container(
              color: Colors.red,
              height: 20.h,
              width: 100.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 15.h,
                      height: 15.h,
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
                  Text(
                    "Adem",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.33,
                    ),
                  ),
                ],
              )),
          Container(
            color: Colors.white,
            height: 59.h,
            child: SingleChildScrollView(
                child: Column(
              children: List<Widget>.generate(titles.length, (int index) {
                return buildItem(index);
              }),
            )),
          )
        ],
      ),
    );
  }

  Widget buildItem(int index) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: const BeveledRectangleBorder()),
        onPressed: () {
          setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => pages.elementAt(index)));
          });
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
