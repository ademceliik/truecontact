import 'package:calisma_app_1/view/map_screen.dart';
import 'package:calisma_app_1/view/menu_screen.dart';
import 'package:calisma_app_1/view/search_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'menu/account_details_screen.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MapScreen(), //Container(child: Text("1. sayfa")),
    Container(child: Text("1. sayfa")),
    Container(child: Text("floating sayfa")),
    AccountDetailsScreen(),
    MenuScreen(),
  ];

  final List<String> _titles = [
    'Harita',
    'Sohbetler',
    '',
    'Sepetim',
    'Menü',
  ];
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
  };
  buildNavigator() {
    return Navigator(
      key: navigatorKeys[_currentIndex],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (_) => _pages.elementAt(_currentIndex));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_currentIndex < 0 || _currentIndex >= _pages.length) {
      _currentIndex = 0; // Varsayılan olarak 0. sayfayı göster
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      
      body: _pages[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          currentIndex: _currentIndex,
          items: [
            buildItem(
              Icons.map_outlined,
              () {
                // TODO
              },
              0,
            ),
            buildItem(
              Icons.chat_bubble_outline_rounded,
              () {
                // TODO
              },
              1,
            ),
            buildEmptyItem(),
            buildItem(
              Icons.shopping_basket_rounded,
              () {
                // TODO
              },
              3,
            ),
            buildItem(
              Icons.menu,
              () {
                // TODO
              },
              4,
            ),
          ],
        ),
      ),
      floatingActionButton: buildFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildFloatingButton() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _currentIndex = 2;
          Navigator.push(context, MaterialPageRoute(
                builder: (_) => SearchScreenView()));
        });
        print(_currentIndex);
        Navigator(
          key: navigatorKeys[_currentIndex],
          onGenerateRoute: (RouteSettings settings) {
            return MaterialPageRoute(
                builder: (_) => _pages.elementAt(_currentIndex));
          },
        );
      },
      child: Container(
        width: 9.h,
        height: 9.h,
        decoration: ShapeDecoration(
          color: Colors.red,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2.w,
              color: _currentIndex == 2 ? Colors.red : Colors.red,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Image.asset("assets/logo/logo.png"),
      ),
    );
  }

  BottomNavigationBarItem buildEmptyItem() {
    return BottomNavigationBarItem(
      icon: SizedBox.shrink(),
      label: '',
    );
  }

  BottomNavigationBarItem buildItem(
      IconData icon, void Function()? onTap, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 20.w,
                height: 5.h,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Icon(
                  icon,
                  color: _currentIndex == index ? Colors.pink : Colors.white,
                )),
            Text(
              _titles[index],
              style: TextStyle(
                color: _currentIndex == index ? Colors.pink : Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.33,
              ),
            ),
          ],
        ),
      ),
      label: '',
    );
  }
}
