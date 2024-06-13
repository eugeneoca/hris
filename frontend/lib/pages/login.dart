import 'package:flutter/material.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/widgets/user_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: Center(
                child: SizedBox(
                  height: 190,
                  width: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const UserField(
                          hintText: "Username:",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const UserField(
                          hintText: "Password:",
                          isPassword: true,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, "/dashboard");
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: primaryColor,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "HR Management System Version 0.0",
                        style: TextStyle(color: primaryFontColor),
                      ),
                      Text(
                        "Copyright © 2024",
                        style: TextStyle(color: primaryFontColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
