import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../model/shop_item.dart';

class MyOrdersScreenView extends StatefulWidget {
  const MyOrdersScreenView({super.key});

  @override
  State<MyOrdersScreenView> createState() => _MyOrdersScreenViewState();
}

class _MyOrdersScreenViewState extends State<MyOrdersScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Siparişlerim"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: List<Widget>.generate(2, (int index) {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.only(left: 2.w, top: 2.w),
                margin: EdgeInsets.only(bottom: 2.w),
                //elevation: 5,
                //color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "15 Ağustos 2024",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            Text(
                              "Toplam: 200 ₺",
                              style: TextStyle(fontSize: 16.sp),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Detaylar ►",
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    ),
                    Divider(
                      height: 2.h,
                    ),
                    Text(
                      "Teslim Edildi",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: 2.h,
                    ),
                    Container(
                      height: 12.h,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, bottom: 2.w),
                            child: SizedBox(
                              height: 8.h,
                              width: 8.h,
                              child: Image.asset("assets/logo/iphone.jpg"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.w, bottom: 2.w),
                            child: SizedBox(
                              height: 8.h,
                              width: 8.h,
                              child: Image.asset("assets/logo/iphone.jpg"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        )
        /* : Text(
              "Hiç Siparişiniz Yok\nHemen Alışverişe Başlayın :)",
              style: TextStyle(fontSize: 16.sp),
            ), */
        );
  }
}
