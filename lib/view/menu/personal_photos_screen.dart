import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonalPhotosScreen extends StatefulWidget {
  const PersonalPhotosScreen({super.key});

  @override
  State<PersonalPhotosScreen> createState() => _PersonalPhotosScreenState();
}

class _PersonalPhotosScreenState extends State<PersonalPhotosScreen> {
  List<String> photoPaths = [
    "assets/logo/logo.png",
    "assets/logo/logo.png",
    "assets/logo/logo.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink.shade300,
          onPressed: () {
            setState(() {
              photoPaths.add("assets/logo/logo.png");
            });
          },
          child: const Icon(Icons.add_a_photo_outlined),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List<Widget>.generate(photoPaths.length, (int index) {
            return Container(
              margin: EdgeInsets.all(1.w),
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 1.w,
                      color: Colors.grey.shade400,
                      style: BorderStyle.solid),
                  image: DecorationImage(
                      image: AssetImage(photoPaths[index]),
                      fit: BoxFit.scaleDown)),
              child: IconButton.filledTonal(
                iconSize: 18,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext) => AlertDialog(
                            title: Text("Sil"),
                            content: Text(
                                "Fotoğrafı Silmek İstediğinize Emin Misiniz?"),
                          ));

                  setState(() {
                    //photoPaths.removeAt(index);
                  });
                },
                icon: const Icon(Icons.delete_outline_rounded),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
              ),
            );
          }),
        ));
  }
}
