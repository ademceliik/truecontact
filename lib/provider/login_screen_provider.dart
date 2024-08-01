import 'package:flutter/material.dart';

import '../model/login_user.dart';

class LoginScreenProvider with ChangeNotifier {
  LoginUser user = LoginUser(email: "", password: "");
  bool isObscure = false; // for password chars visibility

  // set password visibility
  void setIsObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void setEmail(String value) {
    user.email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    user.password = value;
    notifyListeners();
  }
}
