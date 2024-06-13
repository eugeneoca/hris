import 'package:flutter/material.dart';

class UserField extends StatelessWidget {
  final bool isPassword;
  final String hintText;

  const UserField({super.key, this.isPassword = false, this.hintText = ""});

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
                obscureText: isPassword,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.black)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
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
