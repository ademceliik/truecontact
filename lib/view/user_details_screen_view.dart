import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserDetailsScreenView extends StatefulWidget {
  const UserDetailsScreenView({super.key});

  @override
  State<UserDetailsScreenView> createState() => _UserDetailsScreenViewState();
}

class _UserDetailsScreenViewState extends State<UserDetailsScreenView> {
  List<String> titles = ["Mesaj Gönder", "Doğum Günü", "E-posta"];
  List<IconData> icons = [
    Icons.messenger_outline,
    Icons.date_range_outlined,
    Icons.email_outlined
  ];
  List<bool> isAsked = [false, false, false];
  List<bool> isStarTapped = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Adem Çelik",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          Container(
              color: Colors.red,
              height: 25.h,
              width: 100.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 15.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.w,
                              color: Colors.black,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      child: Image.asset("assets/logo/logo.png"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildStar(0),
                      buildStar(1),
                      buildStar(2),
                      buildStar(3),
                      buildStar(4)
                      //Icon(Icons.star_border_outlined),
                    ],
                  ),
                  Text("2.00 / 1 Kişi")
                ],
              )),
          Container(
            padding: EdgeInsets.all(5.w),
            color: Colors.white,
            height: 60.h,
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Kişisel Bilgi",
                    style: TextStyle(color: Colors.red, fontSize: 18.sp)),
                buildItem(0),
                buildItem(1),
                SizedBox(
                  height: 2.h,
                ),
                Text("İletişim Bilgileri",
                    style: TextStyle(color: Colors.red, fontSize: 18.sp)),
                buildItem(2)
              ],
            )),
          )
        ],
      ),
    );
  }

  Widget buildStar(int index) {
    return InkWell(
        onTap: () {
          setState(() {
            for (int i = 0; i <= index; i++) {
              isStarTapped[i] = true;
            }
            for (int i = index + 1; i < isStarTapped.length; i++) {
              isStarTapped[i] = false;
            }
            /* if (index == 0 && isStarTapped[index] == true) {
              setState(() {
                isStarTapped[index] = false;
              });
            } */
          });
        },
        child: Icon(
            color: Colors.yellow,
            !isStarTapped[index] ? Icons.star_border_outlined : Icons.star));
  }

  Widget buildItem(int index) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(7.h),
            padding: EdgeInsets.all(1.h),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder()),
        onPressed: () {
          /* setState(() {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => pages.elementAt(index)));
          }); */
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icons[index],
                  color: Colors.grey,
                ),
                SizedBox(width: 3.w),
                Text(titles[index],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
            isAsked[index]
                ? Text(
                    "İstek Gönderildi",
                    style: TextStyle(color: Colors.grey),
                  )
                : TextButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(15.w),
                            side: BorderSide(color: Colors.grey, width: 1))),
                    child: Text("Sor"),
                    onPressed: () {
                      setState(() {
                        isAsked[index] = true;
                      });
                    },
                  )
          ],
        ));
  }
}
