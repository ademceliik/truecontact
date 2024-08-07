import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonalSocialAccountsScreen extends StatefulWidget {
  const PersonalSocialAccountsScreen({super.key});

  @override
  State<PersonalSocialAccountsScreen> createState() =>
      _PersonalSocialAccountsScreenState();
}

class _PersonalSocialAccountsScreenState
    extends State<PersonalSocialAccountsScreen> {
  List<SocialMedia> accounts = [
    SocialMedia(platform: Platform.youtube, username: "exampleUser")
  ];

  TextEditingController socialTextController = TextEditingController();
  int? socialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink.shade300,
          onPressed: () {
            buildAlertDialog(context: context);
          },
          child: const Icon(Icons.add_link_rounded),
        ),
        body: accounts.isEmpty
            ? Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  "Hesap yok. Bir tane ekleyin!",
                  style: TextStyle(color: Colors.black54),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                    children:
                        List<Widget>.generate(accounts.length, (int index) {
                  return InkWell(
                    onTap: () {
                      _showPicker(context, index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey,
                              strokeAlign: BorderSide.strokeAlignCenter),
                          color: Colors.grey.shade300),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5.w,
                            height: 7.5.h,
                          ),
                          Icon(accounts[index].platform.iconData),
                          SizedBox(width: 5.w),
                          Text(accounts[index].username)
                        ],
                      ),
                    ),
                  );
                })),
              ));
  }

  void _showPicker(context, int index) {
    int pickerIndex = 0;
    showCupertinoModalPopup(
      barrierDismissible: true,
      context: context,
      builder: (_) => Container(
        height: 25.h,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                child: const Text("Seç"),
                onPressed: () {
                  // Edit account details
                  if (pickerIndex == 1) {
                    socialIndex = accounts[index].platform.index;
                    socialTextController.text = accounts[index].username;
                    buildAlertDialog(context: context, index: index);
                  }
                  // Delete account
                  else if (pickerIndex == 2) {
                    setState(() {
                      accounts.removeAt(index);
                    });
                  }
                  Navigator.maybePop(context);
                },
              ),
              SizedBox(
                  height: 15.h,
                  child: CupertinoPicker(
                      scrollController:
                          FixedExtentScrollController(initialItem: 0),
                      itemExtent: 30,
                      onSelectedItemChanged: (value) {
                        pickerIndex = value;
                      },
                      children: const [
                        Text("Vazgeç"),
                        Text("Düzenle"),
                        Text("Kaldır")
                      ])),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildAlertDialog(
      {required BuildContext context, int? index}) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Hesap Ekle"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownMenu(
                      initialSelection: socialIndex,
                      expandedInsets: EdgeInsets.zero,
                      hintText: "Platform Seçiniz",
                      onSelected: (value) {
                        socialIndex = value;
                      },
                      dropdownMenuEntries:
                          List<DropdownMenuEntry<int>>.generate(
                              Platform.values.length, (int index) {
                        return DropdownMenuEntry(
                            value: index, label: Platform.values[index].text);
                      })),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextField(
                    controller: socialTextController,
                    decoration:
                        const InputDecoration(hintText: "Kullanıcı adı"),
                  )
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      socialTextController.text = "";
                      socialIndex = null;
                    },
                    child: const Text(
                      "Vazgeç",
                      style: TextStyle(color: Colors.blue),
                    )),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    if (socialIndex != null &&
                        socialTextController.text.isNotEmpty) {
                      setState(() {
                        if (index == null) {
                          accounts.add(SocialMedia(
                              platform: Platform.values[socialIndex!],
                              username: socialTextController.text));
                        } else {
                          accounts[index].username = socialTextController.text;
                          accounts[index].platform =
                              Platform.values[socialIndex!];
                        }
                      });

                      socialTextController.text = "";
                      socialIndex = null;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Alanlar Doldurulmadı..'),
                        ),
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Ekle",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ));
  }
}

class SocialMedia {
  Platform platform;
  String username;

  SocialMedia({required this.platform, required this.username});
}

enum Platform { youtube, instagram, facebook }

extension PlatformIconDataExtension on Platform {
  IconData get iconData {
    switch (this) {
      case Platform.youtube:
        return Icons.play_arrow_rounded;

      case Platform.instagram:
        return Icons.photo_camera;
      case Platform.facebook:
        return Icons.facebook_rounded;
    }
  }
}

extension PlatformNameExtension on Platform {
  String get text {
    switch (this) {
      case Platform.youtube:
        return "Youtube";
      case Platform.instagram:
        return "Instagram";
      case Platform.facebook:
        return "Facebook";
    }
  }
}
