import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/constants/api_url.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/widgets/user_field.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isError = false;

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
                        UserField(
                          hintText: "Username:",
                          controller: usernameController,
                          isError: isError,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        UserField(
                          hintText: "Password:",
                          isPassword: true,
                          controller: passwordController,
                          isError: isError,
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
                              onPressed: () async => {
                                if (usernameController.text.isEmpty)
                                  {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      clipBehavior: Clip.antiAlias,
                                      margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width -
                                                320,
                                        right: 20,
                                        bottom: 70,
                                      ),
                                      backgroundColor: Colors.red,
                                      showCloseIcon: true,
                                      behavior: SnackBarBehavior.floating,
                                      content:
                                          const Text("Username is required."),
                                    ))
                                  },
                                if (passwordController.text.isEmpty)
                                  {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      clipBehavior: Clip.antiAlias,
                                      margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width -
                                                320,
                                        right: 20,
                                        bottom: 70,
                                      ),
                                      backgroundColor: Colors.red,
                                      showCloseIcon: true,
                                      behavior: SnackBarBehavior.floating,
                                      content:
                                          const Text("Password is required."),
                                    ))
                                  },
                                if (usernameController.text.isNotEmpty &&
                                    passwordController.text.isNotEmpty)
                                  {
                                    http
                                        .post(
                                          Uri.parse("$apiURL/auth/login"),
                                          headers: <String, String>{
                                            'Content-Type':
                                                'application/json; charset=UTF-8',
                                          },
                                          body: jsonEncode({
                                            "username": usernameController.text,
                                            "password": passwordController.text,
                                          }),
                                        )
                                        .then((res) => {
                                              if (res.statusCode != 200)
                                                {
                                                  setState(() {
                                                    isError = true;
                                                  }),
                                                },
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  clipBehavior: Clip.antiAlias,
                                                  margin: EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width -
                                                        320,
                                                    right: 20,
                                                    bottom: 70,
                                                  ),
                                                  backgroundColor:
                                                      jsonDecode(res.body)
                                                              .toString()
                                                              .contains("token")
                                                          ? Colors.green
                                                          : Colors.red,
                                                  showCloseIcon: true,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  content: Text(jsonDecode(
                                                              res.body)
                                                          .toString()
                                                          .contains("message")
                                                      ? jsonDecode(
                                                          res.body)["message"]
                                                      : "Login successful!"),
                                                ),
                                              ),
                                              if (jsonDecode(res.body)
                                                  .toString()
                                                  .contains("token"))
                                                {
                                                  Provider.of<UserAuthProvider>(
                                                          context,
                                                          listen: false)
                                                      .setUser(
                                                          userObject:
                                                              jsonDecode(
                                                                  res.body)),
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context, "/dashboard")
                                                }
                                            })
                                  }
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
