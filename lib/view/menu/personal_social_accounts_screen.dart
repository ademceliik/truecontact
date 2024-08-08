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

  // show picker when tap to any saved account
  void _showPicker(context, int index) {
    showCupertinoModalPopup(
        barrierDismissible: true,
        context: context,
        builder: (_) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);

                      buildAlertDialog(context: context, index: index);
                    },
                    child: const Text("Düzenle")),
                CupertinoActionSheetAction(
                    onPressed: () {
                      setState(() {
                        accounts.removeAt(index);
                      });
                      Navigator.pop(context);
                    },
                    child: const Text("Kaldır")),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(context),
                child: const Text("Vazgeç"),
              ),
            ));
  }

  // show dialog for add and edit an account
  Future<dynamic> buildAlertDialog(
      {required BuildContext context, int? index}) {
    TextEditingController socialTextController = TextEditingController();
    int? socialIndex;
    if (index != null) {
      socialIndex = accounts[index].platform.index;
      socialTextController.text = accounts[index].username;
    }
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

// Social media model for users social media accounts
// will move to model folder
class SocialMedia {
  Platform platform;
  String username;

  SocialMedia({required this.platform, required this.username});
}

enum Platform { youtube, instagram, facebook }

// add icon to platform. can turn to image path
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
