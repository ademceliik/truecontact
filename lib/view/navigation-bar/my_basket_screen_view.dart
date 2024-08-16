import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../model/shop_item.dart';

class MyBasketScreenView extends StatefulWidget {
  const MyBasketScreenView({super.key});

  @override
  State<MyBasketScreenView> createState() => _MyBasketScreenViewState();
}

class _MyBasketScreenViewState extends State<MyBasketScreenView> {
  Map<ShopItem, int> items = {
    ShopItem(
        imagePath: ["assets/logo/iphone.jpg"],
        dealer: "müslüm",
        title: "iphone 15 pro max",
        cost: 1285): 1,
    ShopItem(
        imagePath: ["assets/logo/header-logo.png"],
        dealer: "adem",
        title: "22 ayar 100 gram madonna gerdanlık",
        cost: 250000): 1,
    ShopItem(
        imagePath: ["assets/logo/logo.png"],
        dealer: "yusuf",
        title: "mobil uygulama",
        cost: 120000): 1,
    ShopItem(
        imagePath: ["assets/logo/logo.png"],
        dealer: "trucontact",
        title: "her şey",
        cost: 0): 1,
  };

  int totalCost = 0;

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < items.length; i++) {
      totalCost += items.keys.elementAt(i).cost * items.values.elementAt(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(totalCost: totalCost),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Sepetim"),
      ),
      body: items.length > 0
          ? SingleChildScrollView(
              child: Column(
                children: List<Widget>.generate(items.length, (int index) {
                  return buildBasketItem(index);
                }),
              ),
            )
          : Text(
              "Sepetiniz Boş\nHemen Alışverişe Başlayın :)",
              style: TextStyle(fontSize: 16.sp),
            ),
    );
  }

  Widget buildBasketItem(int index) {
    return SizedBox(
        height: 11.h,
        child: Card(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // show image of item
              Image.asset(
                items.keys.elementAt(index).imagePath[0],
                height: 6.h,
                width: 6.h,
              ),
              // show details of item
              showItemDetails(index),

              // increase or decrease number of item
              editItemNumberButtons(index)
            ],
          ),
        ));
  }

  Widget showItemDetails(int index) {
    return SizedBox(
      width: 40.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // show title of item
          Text(
            maxLines: 3,
            items.keys.elementAt(index).title,
            //"14 promax 128gba",
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // show dealer of item
              SizedBox(
                width: 15.w,
                child: Text(
                  maxLines: 1,
                  items.keys.elementAt(index).dealer,
                  //"ogz",
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),

              // show cost of item
              SizedBox(
                width: 20.w,
                child: Text(
                  maxLines: 1,
                  "${items.keys.elementAt(index).cost} ₺",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget editItemNumberButtons(int index) {
    return Container(
      width: 30.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.red),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // decrease button
          IconButton(
              color: Colors.white,
              onPressed: () {
                totalCost -= items.keys.elementAt(index).cost;
                if (items.values.elementAt(index) > 1) {
                  setState(() {
                    items[items.keys.elementAt(index)] =
                        items.values.elementAt(index) - 1;
                  });
                } else {
                  setState(() {
                    items.remove(items.keys.elementAt(index));
                  });
                }
              },
              icon: const Icon(Icons.remove_circle_outline)),
          // show number of item
          Text(
            "${items.values.elementAt(index)}",
            //"1",
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
          // increase button
          IconButton(
              color: Colors.white,
              onPressed: () {
                setState(() {
                  items[items.keys.elementAt(index)] =
                      items.values.elementAt(index) + 1;
                  totalCost += items.keys.elementAt(index).cost;
                });
              },
              icon: const Icon(Icons.add_circle_outline))
        ],
      ),
    );
  }

  Widget bottomNavigationBar({required int totalCost}) {
    return Container(
      height: 10.h,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Toplam",
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                Text(
                  "$totalCost ₺",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: TextButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.white,
                  splashFactory: NoSplash.splashFactory),
              child: Text(
                "Sepeti Onayla",
                style: TextStyle(color: Colors.red, fontSize: 15.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}
