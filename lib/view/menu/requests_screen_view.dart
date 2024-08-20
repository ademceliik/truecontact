import 'package:calisma_app_1/view/user_details_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RequestsScreenView extends StatefulWidget {
  const RequestsScreenView({super.key});

  @override
  State<RequestsScreenView> createState() => _RequestsScreenViewState();
}

enum RequestTypes { taken, sent }

class _RequestsScreenViewState extends State<RequestsScreenView> {
  RequestTypes requestsView = RequestTypes.taken;
  bool isTry = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(child: Image.asset("assets/logo/header-logo.png")),
          bottom: const TabBar(
            splashFactory: NoSplash.splashFactory,
            labelColor: Colors.red,
            indicatorColor: Colors.red,
            tabs: <Widget>[
              Tab(
                text: "Alınan İstekler",
              ),
              Tab(
                text: "Gönderilen İstekler",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            const Center(
              child: Text("Alınan İstek Yok"),
            ),
            SingleChildScrollView(
              child: Column(
                  children: List<Widget>.generate(1, (int index) {
                return buildPersonItem();
              })),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRequestType() {
    return Container(
      width: MediaQuery.of(context).size.width - 5.w,
      //height: 300,
      decoration: ShapeDecoration(
        color: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.5,
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 32,
            offset: Offset(0, 20),
            spreadRadius: -8,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Icon(
                        Icons.email,
                        size: 3.h,
                      ),
                    ),
                    Text(
                      "E-Posta",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: Text("Bekliyor"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPersonItem() {
    return Column(
      children: [
        Card(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => UserDetailsScreenView()));
                },
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(60))),
                    ),
                    Text(
                      "Adem Çelik",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isTry = !isTry;
                    });
                  },
                  icon: Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 9.w,
                  ))
            ],
          ),
        ),
        if (isTry)
          ListBody(
              children: List<Widget>.generate(
            1,
            (int index) {
              return buildRequestType();
            },
          )),
      ],
    );
  }
}
