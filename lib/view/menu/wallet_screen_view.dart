import 'package:calisma_app_1/widget/custom_text_field.dart';
import 'package:calisma_app_1/widget/my_appbar.dart';
import 'package:calisma_app_1/widget/pink_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widget/true_coin_widget.dart';

class WalletScreenView extends StatefulWidget {
  const WalletScreenView({super.key});

  @override
  State<WalletScreenView> createState() => _WalletScreenViewState();
}

class _WalletScreenViewState extends State<WalletScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TrueCoinWidget(
            coin: 1000,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: ListBody(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.w),
                  child: Text("Metamask Cüzdana Gönder",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.w),
                  child: CustomTextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      hintText: "Göndermek İstediğiniz Token Miktarı",
                      icon: Icons.money_rounded),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.w),
                  child: const CustomTextField(
                      hintText: "Meta Mask Kripto Adresi", icon: Icons.wallet),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: PinkElevatedButton(
                        text: "Gönder", onPress: () {}, condition: true)),
                const Text("Bu İşlem 48 Saate Kadar Sürebilir")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
