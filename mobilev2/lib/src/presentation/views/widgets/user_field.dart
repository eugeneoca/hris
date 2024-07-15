import 'package:flutter/material.dart';

class UserField extends StatelessWidget {
  final bool isPassword;
  final String hintText;
  final TextEditingController controller;
  bool isError;

  UserField(
      {super.key,
      this.isPassword = false,
      this.hintText = "",
      required this.controller,
      this.isError = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(flex: 3, child: Center(child: Text(hintText))),
        Expanded(
            flex: 9,
            child: Center(
              child: TextField(
                controller: controller,
                obscureText: isPassword,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: isError ? Colors.redAccent : Colors.black26),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    filled: false,
                    hintText: hintText == ""
                        ? ""
                        : "Enter ${hintText.replaceAll(':', '')}"),
              ),
            ))
      ],
    );
  }
}
