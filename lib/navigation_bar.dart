import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomNavigationbar extends StatefulWidget {
  CustomNavigationbar({Key? key}) : super(key: key);

  @override
  _CustomNavigationbarState createState() => _CustomNavigationbarState();
}

class _CustomNavigationbarState extends State<CustomNavigationbar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'Home page',
            //style: theme.textTheme.titleLarge,
          ),
        ),
      ),
    ),
    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'second page',
            //style: theme.textTheme.titleLarge,
          ),
        ),
      ),
    ),
    const SizedBox.shrink(), // Boş sayfa

    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            'third page',
            //style: theme.textTheme.titleLarge,
          ),
        ),
      ),
    ),
    const Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(8.0),
      child: SizedBox.expand(
        child: Center(
          child: Text(
            '4. page',
            //style: theme.textTheme.titleLarge,
          ),
        ),
      ),
    ),

    //MenuPage(),
  ];

  final List<String> _titles = [
    'Anasayfa',
    'İstasyonlar',
    '',
    'Bildirimler',
    'Menu',
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
      body: _pages[_currentIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          buildItem(
            /* _currentIndex == 0
                ? "assets/icon/homet.png"
                : "assets/icon/homeicon.png", */
            () {
              // Anasayfa için yapılacak işlem
            },
            0,
          ),
          buildItem(
            /*  _currentIndex == 1
                ? "assets/icon/markert.png"
                : "assets/icon/markerg.png", */
            () {
              // İstasyonlar için yapılacak işlem
            },
            1,
          ),
          buildEmptyItem(),
          buildItem(
            /*  _currentIndex == 3
                ? "assets/icon/notificationst.png"
                : "assets/icon/notificationsg.png", */
            () {},
            3,
          ),
          buildItem(
            /* _currentIndex == 4
                ? "assets/icon/menut.png"
                : "assets/icon/menug.png", */
            () {},
            4,
          ),
        ],
      ),
      floatingActionButton: buildFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildFloatingButton() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // uyari();
        /*  Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return OtherPage();
          },
        )); */
      },
      child: SizedBox(
        width: 8.h,
        height: 8.h,
        child: Container(
          width: 6.h,
          height: 6.h,
          decoration: ShapeDecoration(
            //color: ConstColors.myOrange,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1,
                //color: _currentIndex == 2 ? ConstColors.myOrange : Colors.white,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  BottomNavigationBarItem buildEmptyItem() {
    return const BottomNavigationBarItem(
      icon: SizedBox.shrink(),
      label: '',
    );
  }

  BottomNavigationBarItem buildItem(
      /* String imagePath, */ void Function()? onTap, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        //color: ConstColors.navbarcolor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30.h,
              height: 30.h,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              //child: Image.asset(imagePath),
            ),
            Text(
              _titles[index],
              style: const TextStyle(
                /*     color: _currentIndex == index
                    ? ConstColors.myOrange
                    : ConstColors.tripyiconcolor, */
                fontSize: 12,
                fontFamily: 'Poppins',
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
