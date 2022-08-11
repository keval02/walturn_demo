import 'dart:core';

import 'package:connectivity/connectivity.dart';

import 'email_validator.dart';


class AppHelper{
  static String emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static bool validateEmailAddress(String emailId) {
    return EmailValidator.validate(emailId);
  }

  static bool validatePassword(String password) {
    if (password.length < 6) return false;
    if (!password.contains(RegExp(r"[a-z]"))) {
      return false;
    }
    if (!password.contains(RegExp(r"[A-Z]"))) {
      return false;
    }
    if (!password.contains(RegExp(r"[0-9]"))) {
      return false;
    }
    if (!password.contains(RegExp(r'[=+!@#$%^&*()-\,.?";_~:{}`|<>[\]\\]'))) {
      return false;
    }
    return true;
  }

  static Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}