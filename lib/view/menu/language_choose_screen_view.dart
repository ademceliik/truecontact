import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/logo/header-logo.png")),
      ),
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
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 2.w),
                                height: 6.h,
                                width: 6.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                          "assets/logo/logo.png",
                                        )),
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: Colors.black,
                                        style: BorderStyle.solid),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(60))),
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
