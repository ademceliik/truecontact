import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyOrdersScreenView extends StatefulWidget {
  const MyOrdersScreenView({super.key});

  @override
  State<MyOrdersScreenView> createState() => _MyOrdersScreenViewState();
}

class _MyOrdersScreenViewState extends State<MyOrdersScreenView> {
  List<Order> myOrders = [
    Order(
        date: "15 Ağustos 2024",
        cost: 200.00,
        status: 1,
        itemPhotoPaths: ["assets/logo/iphone.jpg", "assets/logo/logo.png"]),
    Order(date: "16 Ağustos 2024", cost: 1285.25, status: 2, itemPhotoPaths: [
      "assets/logo/header-logo.png",
      "assets/logo/logo.png"
    ]),
    Order(
        date: "17 Ağustos 2024",
        cost: 99.99,
        status: 0,
        itemPhotoPaths: ["assets/logo/logo.png", "assets/logo/iphone.jpg"])
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Siparişlerim"),
      ),
      body: myOrders.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: List<Widget>.generate(myOrders.length, (int index) {
                  return buildOrderCard(index);
                }),
              ),
            )
          : Text(
              "Hiç Siparişiniz Yok\nHemen Alışverişe Başlayın :)",
              style: TextStyle(fontSize: 16.sp),
            ),
    );
  }

  Widget buildOrderCard(int index) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 2.w, top: 2.w),
      margin: EdgeInsets.only(bottom: 2.w, left: 1.w, right: 1.w),
      //elevation: 5,
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          dateAndCostHeader(index),
          Divider(
            height: 2.h,
          ),
          orderStatus(myOrders[index].status),
          Divider(
            height: 2.h,
          ),
          showOrderItemsPhoto(index),
        ],
      ),
    );
  }

  Widget orderStatus(int status) {
    return Text(
      status == 0
          ? "Onaylandı"
          : status == 1
              ? "Bekliyor"
              : "İptal Edildi",
      style: TextStyle(
          color: status == 0
              ? Colors.green.shade800
              : status == 1
                  ? Colors.yellow.shade800
                  : Colors.red.shade800,
          fontWeight: FontWeight.w600),
    );
  }

  Widget showOrderItemsPhoto(int index) {
    Order item = myOrders[index];
    return SizedBox(
        height: 12.h,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children:
                List<Widget>.generate(item.itemPhotoPaths.length, (int i) {
              return Padding(
                padding: EdgeInsets.only(left: 2.w, bottom: 2.w),
                child: SizedBox(
                  height: 8.h,
                  width: 8.h,
                  child: Image.asset(item.itemPhotoPaths[i]),
                ),
              );
            })));
  }

  Widget dateAndCostHeader(int index) {
    Order item = myOrders[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.date,
              style: TextStyle(fontSize: 15.sp),
            ),
            Text(
              "Toplam: ${item.cost} ₺",
              style: TextStyle(fontSize: 16.sp),
            )
          ],
        ),
        /* TextButton(
            onPressed: () {},
            child: Text(
              "Detaylar ►",
              style: TextStyle(color: Colors.red),
            )) */
      ],
    );
  }
}

class Order {
  String date;
  double cost;
  int status;
  List<String> itemPhotoPaths;

  Order(
      {required this.date,
      required this.cost,
      required this.status,
      required this.itemPhotoPaths});
}
