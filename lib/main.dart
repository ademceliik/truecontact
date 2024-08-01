import 'package:calisma_app_1/navigation_bar.dart';
import 'package:calisma_app_1/view/forgot_password_screen.dart';
import 'package:calisma_app_1/view/login_screen.dart';
import 'package:calisma_app_1/view/map_screen.dart';
import 'package:calisma_app_1/view/navigation_bar.dart';
import 'package:calisma_app_1/view/navigation_settings_screen.dart';
import 'package:calisma_app_1/view/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'provider/login_screen_provider.dart';
import 'provider/register_screen_provider.dart';
import 'view/new_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        //debugShowCheckedModeBanner: false, // bunu kaldır gözünü seveyim
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
/*     final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.sizeOf(context);
    final double width = size.width;
    final double height = size.height -
        MediaQuery.of(context).viewPadding.top -
        MediaQuery.of(context).viewPadding.bottom; */

    return Scaffold(
        resizeToAvoidBottomInset: false,
        /* appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ), */
        body: MyNavigationBar());

    /* ChangeNotifierProvider<LoginScreenProvider>(
            create: (context) => LoginScreenProvider(),
            child: const LoginScreenView())); */

    //LoginScreenView());
  }
}
