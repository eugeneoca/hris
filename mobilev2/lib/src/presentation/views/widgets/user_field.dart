import 'package:flutter/material.dart';

class UserField extends StatelessWidget {
  final bool isPassword;
  final String hintText;
  final bool isPasswordVisible;
  final TextEditingController textEditingController;
  final void Function()? onPressed;
  final bool isError;
  const UserField(
      {super.key,
      this.isPassword = false,
      required this.hintText,
      this.isPasswordVisible = false,
      required this.textEditingController,
      this.onPressed,
      required this.isError});

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
              controller: textEditingController,
              obscureText: isPasswordVisible,
              decoration: InputDecoration(
                  suffixIcon:
                      isPassword ? IconButton(onPressed: onPressed, icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility)) : null,
                  focusedBorder:
                      const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: isError ? Colors.redAccent : Colors.black26),
                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  filled: false,
                  hintText: hintText == "" ? "" : "Enter ${hintText.replaceAll(':', '')}"),
            ),
          ),
        ),
      ],
    );
  }
}
