import 'package:calisma_app_1/widget/custom_text_field.dart';
import 'package:calisma_app_1/widget/pink_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletScreenView extends StatefulWidget {
  const WalletScreenView({super.key});

  @override
  State<WalletScreenView> createState() => _WalletScreenViewState();
}

class _WalletScreenViewState extends State<WalletScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/logo/header-logo.png")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.grey.shade200,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.w),
                child: Column(
                  children: [
                    Container(
                      height: 13.h,
                      width: 13.h,
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(60))),
                    ),
                    Text("True Coin : 1000",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(4.w),
            child: Text("Metamask Cüzdana Gönder",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 4.w),
            child: CustomTextField(
                hintText: "Göndermek İstediğiniz Token Miktarı",
                icon: Icons.money_rounded),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 4.w),
            child: CustomTextField(
                hintText: "Meta Mask Kripto Adresi", icon: Icons.wallet),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: 4.w),
                child: PinkElevatedButton(
                    text: "Gönder", onPress: () {}, condition: true),
              )),
          Text("Bu İşlem 48 Saate Kadar Sürebilir")
        ],
      ),
    );
  }
}
