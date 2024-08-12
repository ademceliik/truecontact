import 'package:calisma_app_1/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreenView extends StatefulWidget {
  const SearchScreenView({super.key});

  @override
  State<SearchScreenView> createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/logo/header-logo.png")),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {}),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
                hintText: "Mağaza veya Kişi Ara..", icon: Icons.search_rounded),
            Container(
                height: 100.h,
                child: GridView.count(
                    crossAxisCount: 2,
                    children: List<Widget>.generate(2, (int index) {
                      return buildItem(index);
                    })))
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
