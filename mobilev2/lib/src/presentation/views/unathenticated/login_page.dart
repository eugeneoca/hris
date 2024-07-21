import 'package:flutter/material.dart';
import 'package:mobilev2/src/core/call_bloc_helper.dart';
import 'package:mobilev2/src/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mobilev2/src/presentation/views/widgets/custom_snackbar.dart';
import 'package:mobilev2/src/presentation/views/widgets/user_field.dart';

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
                  height: 250,
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
                                  backgroundColor: Colors.red,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              onPressed: () {
                                if (usernameController.text.isEmpty ||
                                    passwordController.text.isEmpty) {
                                  CustomSnackbar().showErrorSnackbar(context,
                                      content: "Please complete all fields.");
                                } else {
                                  authBloc.add(LoginEvent(
                                      username: usernameController.text,
                                      password: passwordController.text));
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
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "HR Management System Version v1.0.0",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Copyright © 2024",
                        style: TextStyle(color: Colors.white),
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
