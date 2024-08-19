import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RequestsScreenView extends StatefulWidget {
  const RequestsScreenView({super.key});

  @override
  State<RequestsScreenView> createState() => _RequestsScreenViewState();
}

class _RequestsScreenViewState extends State<RequestsScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/logo/header-logo.png")),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
        child: ToggleSwitch(
          customTextStyles: [TextStyle(fontSize: 16.sp)],
          minWidth: 50.w,
          initialLabelIndex: 1,
          cornerRadius: 20.0,
          activeFgColor: Colors.white,
          inactiveBgColor: Colors.grey.shade400,
          inactiveFgColor: Colors.black54,
          totalSwitches: 2,
          labels: ['Alınan İstekler', 'Gönderilen İstekler'],
          activeBgColors: [
            [Colors.red],
            [Colors.red]
          ],
          onToggle: (index) {
            print('switched to: $index');
          },
        ),
      ),
    );
  }
}
