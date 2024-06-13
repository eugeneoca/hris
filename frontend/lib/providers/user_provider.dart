import 'package:flutter/material.dart';

class UserAuthProvider extends ChangeNotifier {
  int userId;
  String role;
  String token;

  int code;
  String message;

  bool success;

  UserAuthProvider(
      {this.userId = 0,
      this.token = "",
      this.role = "",
      this.code = 0,
      this.message = "",
      this.success = false});

  void setUser({
    required dynamic userObject,
  }) async {
    try {
      userId = userObject["user"]["id"];
      role = userObject["user"]["role"]["name"];
      token = userObject["token"];
      success = true;
    } catch (error) {
      code = userObject["code"];
      message = userObject["message"];
      success = false;
    }
    notifyListeners();
  }
}
