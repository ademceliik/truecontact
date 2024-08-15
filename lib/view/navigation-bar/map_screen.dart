import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../model/can_visible_item.dart';
import '../../widget/map_navbar_item.dart';
import '../../widget/my_icon_button.dart';
import '../navigation_settings_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.948597, 34.662338),
    zoom: 5.4746,
  );

  List<CanVisibleItem> visibleList = [
    CanVisibleItem(title: "Kişiler"),
    CanVisibleItem(title: "Taksi"),
    CanVisibleItem(title: "Fırın")
  ];
  List<Marker> markers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            child: const GoogleMap(
              myLocationButtonEnabled: false,
              mapToolbarEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              myLocationEnabled: true,
              //markers: markers,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              minMaxZoomPreference: MinMaxZoomPreference(1.0, 20.0),
            ),
          ),
          Positioned(
            top: 1.h,
            left: 1.h,
            right: 1.h,
            child: NavigationBar(
              height: 7.h,
              backgroundColor: Colors.white.withOpacity(0.6),
              destinations: /* List<Widget>.generate(4, (int index) {
              return MapNavbarItem(icon: Icon(Icons.shopify), text: "Market");
            }) */

                  const [
                MapNavbarItem(icon: Icon(Icons.shopify), text: "Market"),
                MapNavbarItem(icon: Icon(Icons.hotel), text: "Otel"),
                MapNavbarItem(icon: Icon(Icons.other_houses), text: "Diğer"),
                MapNavbarItem(
                    icon: Icon(Icons.list_alt_outlined), text: "Anket")
              ],
            ),
          ),
          Positioned(
              top: 12.h,
              right: 1.h,
              child: MyIconButton(
                iconData: Icons.arrow_back_ios_outlined,
                onPressed: () {
                  buildAlertDialog(
                    context,
                    'Görüntülenecekler Listesi',
                  );
                },
              )),
          Positioned(
              bottom: 1.h,
              left: 1.h,
              child: MyIconButton(
                iconData: Icons.refresh_rounded,
                onPressed: () {},
              )),
          Positioned(
              bottom: 1.h,
              right: 1.h,
              child: MyIconButton(
                iconData: Icons.navigation_sharp,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => NavigationSettingScreen()));
                },
              ))
        ],
      ),
    );
  }

  buildAlertDialog(BuildContext context, String title) {
    return showDialog<void>(
      barrierColor: Colors.black.withOpacity(0.1),
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: StatefulBuilder(
            builder: (context, setState) => SingleChildScrollView(
              child: ListBody(
                  children:
                      List<Widget>.generate(visibleList.length, (int index) {
                return CheckboxListTile(
                  title: Text(visibleList[index].title),
                  value: visibleList[index].condition,
                  onChanged: (value) {
                    setState(() {
                      visibleList[index].condition =
                          !visibleList[index].condition;
                    });
                  },
                );
              })),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
