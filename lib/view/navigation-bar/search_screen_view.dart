import 'package:calisma_app_1/model/shop_item.dart';
import 'package:calisma_app_1/view/item_details_screen_view.dart';
import 'package:calisma_app_1/view/user_details_screen_view.dart';
import 'package:calisma_app_1/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreenView extends StatefulWidget {
  const SearchScreenView({super.key});

  @override
  State<SearchScreenView> createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {
  ShopItem item = ShopItem(
      title: "Iphone 15 Pro Max 256GB",
      cost: 45000,
      dealer: "Müslüm",
      details: "Detaylar",
      imagePath: ["assets/logo/logo.png", "assets/logo/logo.png"]);
  bool hasResult = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/logo/header-logo.png")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    setState(() {
                      hasResult = true;
                    });
                  } else {
                    setState(() {
                      hasResult = false;
                    });
                  }
                },
                hintText: "Mağaza veya Kişi Ara..",
                icon: Icons.search_rounded),
            Container(
                height: 100.h,
                child: hasResult
                    ? Column(
                        children: List<Widget>.generate(2, (int index) {
                        return buildSearchItem(index);
                      }))
                    : GridView.count(
                        crossAxisCount: 2,
                        children: List<Widget>.generate(2, (int index) {
                          return buildItem(index);
                        })))
          ],
        ),
      ),
    );
  }

  Widget buildSearchItem(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserDetailsScreenView()));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        height: 8.h,
        margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 1.w),
        child: Row(
          children: [
            SizedBox(width: 5.w),
            Icon(Icons.person),
            SizedBox(width: 10.w),
            SizedBox(
              width: 70.w,
              child: const Text(
                  maxLines: 2, overflow: TextOverflow.visible, "Adem Çelik"),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ItemDetailsScreenView(item: item)));
      },
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              item.imagePath[0],
              fit: BoxFit.fill,
            ),
            Text(
              item.title,
              textAlign: TextAlign.center,
            ),
            Text("${item.cost} tl")
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10,
        margin: EdgeInsets.all(10),
      ),
    );
  }
}
