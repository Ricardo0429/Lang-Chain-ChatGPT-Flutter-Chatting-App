import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  void show(String code) {
    print("toast code:  " + code);
    String error = code;
    // sign up error code
    if (code == "weak-password")
      error = "The password provided is too weak.";
    else if (code == "email-already-in-use")
      error = "The account already exists for that email.";
    else if (code == "invalid-email")
      error = "Please input valid email";
    // sign in error code
    else if (code == "wrong-password")
      error = "Password is incorrect";
    else if (code == "user-not-found")
      error = "User with that email not found";
    // mutli factor authentication
    else if (code == "second-factor-required")
      error = "Phone Verification Requried";
    // phone number
    else if (code == "invalid-phone-number")
      error = "Please input valid phone number";
    else if (code == "invaild-sms-code")
      error = "Please input valid Code that you received";
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static final _singleton = ToastService._instance();
  ToastService._instance() {}

  factory ToastService() {
    return _singleton;
  }
}
