import 'package:calisma_app_1/widget/image_with_border.dart';
import 'package:calisma_app_1/widget/my_appbar.dart';
import 'package:calisma_app_1/widget/my_icon_button.dart';
import 'package:calisma_app_1/widget/true_coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuyTruecoinScreenView extends StatefulWidget {
  const BuyTruecoinScreenView({super.key});

  @override
  State<BuyTruecoinScreenView> createState() => _BuyTruecoinScreenViewState();
}

class _BuyTruecoinScreenViewState extends State<BuyTruecoinScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: [
          const TrueCoinWidget(coin: 1000),
          Container(
              height: 64.h,
              child: GridView.count(
                physics: PageScrollPhysics(),
                crossAxisCount: 3,
                children: [
                  buildOfferItem(),
                  buildOfferItem(),
                  buildOfferItem(),
                  buildOfferItem(),
                  buildOfferItem(),
                ],
              ))
        ],
      ),
    );
  }

  Widget buildOfferItem() {
    return Container(
      margin: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
          color: Colors.yellow.shade100,
          border: Border.all(
              width: 1,
              color: Colors.orange.shade300,
              style: BorderStyle.solid),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      //  height: 16.h,
      //  width: 14.h,
      // color: Colors.yellow.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.w),
            child: ImageWithBorder(
                height: 6.h,
                width: 6.h,
                borderWidth: 0.1.w,
                imagePath: "assets/logo/logo.png"),
          ),
          Text(
            "₺ 17.99",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
          ),
          Text(
            "100 Coin",
            style: TextStyle(fontSize: 15.sp),
          )
        ],
      ),
    );
  }
}
