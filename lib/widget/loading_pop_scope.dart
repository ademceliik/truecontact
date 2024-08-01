import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoadingPopScope extends StatelessWidget {
  const LoadingPopScope({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.h),
              ),
            ),
            content: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.h),
              height: 10.h,
              child: const CircularProgressIndicator(
                color: Colors.orange,
              ),
            ),
          );
        },
      ),
    );
  }
}
