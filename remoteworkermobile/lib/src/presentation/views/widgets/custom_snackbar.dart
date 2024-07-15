import 'package:flutter/material.dart';

class CustomSnackbar {
  showErrorSnackbar(BuildContext context, {required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width - 320,
        right: 20,
        bottom: 70,
      ),
      backgroundColor: Colors.red,
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      content: Text(content),
    ));
  }

  showSuccessSnackbar(BuildContext context, {required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width - 320,
        right: 20,
        bottom: 70,
      ),
      backgroundColor: Colors.green,
      showCloseIcon: true,
      behavior: SnackBarBehavior.floating,
      content: Text(content),
    ));
  }
}
