import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              color: Colors.red,
              height: 20.h,
              width: 100.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 15.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.w,
                              color: Colors.black,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(60))),
                      child: Image.asset("assets/logo/logo.png"),
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
            height: 64.h,
            child: SingleChildScrollView(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const BeveledRectangleBorder()),
                  onPressed: () {},
                  child: Row(
                    children: [
                      SizedBox(width: 5.w),
                      Icon(
                        Icons.shopping_basket_rounded,
                        color: Colors.pink,
                      ),
                      SizedBox(width: 3.w),
                      Text("Buton",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ))
                    ],
                  )), /* ListBody(
                  children: List<Widget>.generate(15, (int index) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const BeveledRectangleBorder()),
                    onPressed: () {},
                    child: Row(
                      children: [
                        SizedBox(width: 5.w),
                        Icon(
                          Icons.shopping_basket_rounded,
                          color: Colors.pink,
                        ),
                        SizedBox(width: 3.w),
                        Text("Buton",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                            ))
                      ],
                    ));
              })), */
            ),
          )
        ],
      ),
    );
  }
}
