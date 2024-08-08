// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonalAddressScreen extends StatefulWidget {
  const PersonalAddressScreen({super.key});

  @override
  State<PersonalAddressScreen> createState() => _PersonalAddressScreenState();
}

class _PersonalAddressScreenState extends State<PersonalAddressScreen> {
  List<AddressItem> addresses = [
    AddressItem(
        addressName: "Evim",
        addressDetails:
            "Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet. ",
        postalCode: 63300),
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
          child: const Icon(Icons.add_home_outlined),
        ),
        body: addresses.isEmpty
            ? Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  "Adres bulunamadı. Bir tane ekleyin!",
                  style: TextStyle(color: Colors.black54),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                    children:
                        List<Widget>.generate(addresses.length, (int index) {
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
                          ),
                          Icon(
                            Icons.home_outlined,
                            size: 8.w,
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                addresses[index].addressName,
                                style: TextStyle(
                                    height: 0.5.w,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.sp),
                              ),
                              SizedBox(
                                width: 80.w,
                                child: Text(
                                  addresses[index].addressDetails,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      overflow: TextOverflow.visible),
                                  maxLines: 3,
                                ),
                              ),
                              Text(
                                addresses[index].postalCode.toString(),
                                style: TextStyle(
                                    height: 0.7.w, color: Colors.black54),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })),
              ));
  }

  // show picker when tap to any saved address
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
                        addresses.removeAt(index);
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
    TextEditingController addressNameController = TextEditingController();
    TextEditingController addressDetailsController = TextEditingController();
    TextEditingController postalCodeController = TextEditingController();
    if (index != null) {
      addressNameController.text = addresses[index].addressName;
      addressDetailsController.text = addresses[index].addressDetails;
      postalCodeController.text = addresses[index].postalCode.toString();
    }
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Adres Ekle"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: addressNameController,
                    decoration: const InputDecoration(hintText: "Adres Adı"),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextField(
                    minLines: 2,
                    maxLines: 3,
                    controller: addressDetailsController,
                    decoration: const InputDecoration(hintText: "Açık Adres"),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextField(
                    controller: postalCodeController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(hintText: "Posta Kodu"),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      addressNameController.text = "";
                      addressDetailsController.text = "";
                      postalCodeController.text = "";
                    },
                    child: const Text(
                      "Vazgeç",
                      style: TextStyle(color: Colors.blue),
                    )),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    if (addressNameController.text.isNotEmpty &&
                        addressDetailsController.text.isNotEmpty &&
                        postalCodeController.text.isNotEmpty) {
                      setState(() {
                        if (index == null) {
                          addresses.add(AddressItem(
                              addressName: addressNameController.text,
                              addressDetails: addressDetailsController.text,
                              postalCode:
                                  int.parse(postalCodeController.text)));
                        } else {
                          addresses[index].addressName =
                              addressNameController.text;
                          addresses[index].addressDetails =
                              addressDetailsController.text;
                          addresses[index].postalCode =
                              int.parse(postalCodeController.text);
                        }
                      });

                      addressNameController.text = "";
                      addressDetailsController.text = "";
                      postalCodeController.text = "";
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

// Address model for users addresses
// will move to model folder
class AddressItem {
  String addressName;
  String addressDetails;
  int postalCode;
  AddressItem({
    required this.addressName,
    required this.addressDetails,
    required this.postalCode,
  });
}
