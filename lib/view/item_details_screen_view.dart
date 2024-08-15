import 'package:calisma_app_1/model/shop_item.dart';
import 'package:calisma_app_1/widget/pink_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ItemDetailsScreenView extends StatefulWidget {
  const ItemDetailsScreenView({super.key, required this.item});

  final ShopItem item;
  @override
  State<ItemDetailsScreenView> createState() => _ItemDetailsScreenViewState();
}

class _ItemDetailsScreenViewState extends State<ItemDetailsScreenView> {
  late ShopItem
      item; /* ShopItem(
      title: "Iphone 15 Pro Max 256GB",
      cost: 45000,
      dealer: "Müslüm",
      details: "Detaylar",
      imagePath: ["assets/logo/logo.png", "assets/logo/logo.png"]); */

  @override
  void initState() {
    super.initState();
    item = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.red,
          //margin: EdgeInsets.only(bottom: 2.h),
          //padding: EdgeInsets.only(right: 5.w, bottom: 2.h),
          height: 10.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  buildImage(),
                  Text(
                    item.dealer,
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ],
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
                    "Mesaj Gönder",
                    style: TextStyle(color: Colors.red, fontSize: 15.sp),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30.h,
              child: CarouselView(
                itemSnapping: true,
                scrollDirection: Axis.horizontal,
                itemExtent: double.infinity,
                children:
                    List<Widget>.generate(item.imagePath.length, (int index) {
                  return Center(child: Image.asset(item.imagePath[index]));
                }),
              ),
            ),
            Container(
              // color: Colors.red,
              padding: const EdgeInsets.all(10),
              height: 53.h,
              width: 100.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    "${item.cost} ₺",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  Text(
                    maxLines: 1,
                    item.title,
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    maxLines: 10,
                    item.details ?? "",
                    style: TextStyle(fontSize: 16.sp),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  //color: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  // margin: EdgeInsets.only(bottom: 2.h),
                  child: TextButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.red,
                        splashFactory: NoSplash.splashFactory),
                    child: Text(
                      "Sepete Ekle",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                  )),
            ),
          ],
        ));
  }

  Widget buildImage() {
    return Container(
      width: 9.h,
      height: 9.h,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/logo/logo.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(
          color: Colors.grey,
          width: 4.0,
        ),
      ),
    );
  }
}
