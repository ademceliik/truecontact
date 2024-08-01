import 'package:flutter/material.dart';

import '../model/register_user.dart';

class RegisterScreenProvider with ChangeNotifier {
  RegisterUser user = RegisterUser();
  bool isObscure = true; // for password chars visibility
  List<String> genderList = ["Erkek", "Kadın", "Belirtmek İstemiyorum"];
  List<String> workList = ["Teknoloji", "Tarım", "Market", "Kuyumcu", "Diğer"];
  List<bool> checkList =
      List<bool>.generate(6, (item) => false, growable: false);

  // set password visibility
  void setIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void setRadioIndex(int value) {
    checkList[0] = true;
    user.accountType = value;
    notifyListeners();
  }

  void setPickerIndex(int value) {
    user.genderOrWork = value;
    checkList[5] = true;

    notifyListeners();
  }

  void setName(String value) {
    user.name = value;
    checkList[1] = value.length > 4;
    notifyListeners();
  }

  void setEmail(String value) {
    user.email = value;
    checkList[2] = RegExp(r'^\S+@\S+$').hasMatch(value);
    notifyListeners();
  }

  void setBirthday(DateTime value) {
    user.birthday = value;
    checkList[4] = value.year < DateTime.now().year - 17;
    notifyListeners();
  }
/* 
  void setSelection(int value) {
    user.genderOrWork = value;
    notifyListeners();
  } */

  void setPassword(String value) {
    user.password = value;
    checkList[3] = value.length > 7;
    notifyListeners();
  }
}
