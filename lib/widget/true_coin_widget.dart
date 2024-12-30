import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'image_with_border.dart';

class TrueCoinWidget extends StatelessWidget {
  const TrueCoinWidget({
    super.key,
    required this.coin,
  });

  final int coin;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: Column(
            children: [
              ImageWithBorder(
                height: 13.h,
                width: 13.h,
                borderWidth: 0.5.w,
                imagePath: "assets/logo/logo.png",
              ),
              Text("True Coin : $coin",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}
