import 'package:calisma_app_1/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreenView extends StatefulWidget {
  const SearchScreenView({super.key});

  @override
  State<SearchScreenView> createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {
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
                  if (text.length > 0) {
                    setState(() {
                      hasResult = true;
                    });
                  } else
                    setState(() {
                      hasResult = false;
                    });
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
      onTap: () {},
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
              child: Text(
                  maxLines: 2, overflow: TextOverflow.visible, "Adem Çelik"),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(int index) {
    return Card(
      color: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/logo/logo.png',
            fit: BoxFit.fill,
          ),
          Text(
            'Iphone 12s 128gb aaaaaaa',
            textAlign: TextAlign.center,
          ),
          Text("1250tl")
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      margin: EdgeInsets.all(10),
    );
  }
}
