import 'package:flutter/material.dart';

class UserAuthProvider extends ChangeNotifier {
  int userId;
  int roleId;
  String token;

  int code;
  String message;

  bool success;

  UserAuthProvider(
      {this.userId = -1,
      this.token = "",
      this.roleId = -1,
      this.code = -1,
      this.message = "",
      this.success = false});

  void setUser({
    required dynamic userObject,
  }) async {
    try {
      userId = userObject["user"]["id"];
      roleId = userObject["user"]["role"]["id"];
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
