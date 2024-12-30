import 'package:calisma_app_1/widget/image_with_border.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/my_appbar.dart';

class LanguageChooseScreenView extends StatefulWidget {
  const LanguageChooseScreenView({super.key});

  @override
  State<LanguageChooseScreenView> createState() =>
      _LanguageChooseScreenViewState();
}

class _LanguageChooseScreenViewState extends State<LanguageChooseScreenView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 80.h,
            child: ListView.builder(
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 2, //iconList.length,
              itemBuilder: (BuildContext context, int position) {
                return InkWell(
                  onTap: () => setState(() => selectedIndex = position),
                  child: SizedBox(
                    width: 100.w,
                    child: Card(
                      color: Colors.grey.shade100,
                      shape: (selectedIndex == position)
                          ? RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(color: Colors.red))
                          : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageWithBorder(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 2.w),
                                height: 6.h,
                                width: 6.h,
                                imagePath: "assets/logo/logo.png",
                                borderWidth: 0.5.w,
                              ),
                              Text(
                                "Türkçe",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                          if (selectedIndex == position)
                            Icon(
                              Icons.check_rounded,
                              size: 9.w,
                            )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
