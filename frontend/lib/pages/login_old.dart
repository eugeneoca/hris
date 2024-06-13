import 'package:flutter/material.dart';
import 'package:frontend/api/auth.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
                const Text(
                  "JENNIE'S PORK CHICHARON",
                  style: TextStyle(color: Colors.red, fontSize: 32),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Username",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 312,
                      child: TextField(
                        style: const TextStyle(height: 1, fontSize: 20),
                        onChanged: (data) => {username = data, setState(() {})},
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          hintText: 'Enter username',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    SizedBox(
                      width: 312,
                      child: TextField(
                        style: const TextStyle(height: 1, fontSize: 20),
                        onChanged: (data) => {password = data, setState(() {})},
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          hintText: 'Enter password',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                SizedBox(
                  width: 410,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Provider.of<UserAuthProvider>(context, listen: false)
                              .setUser(
                                  userObject:
                                      await loginUser(username, password));
                          //Get.to(() => const Dashboard());
                        },
                        style: ButtonStyle(
                            foregroundColor:
                                const WidgetStatePropertyAll<Color>(
                                    Colors.black),
                            backgroundColor:
                                const WidgetStatePropertyAll<Color>(
                                    Colors.yellow),
                            shape:
                                WidgetStatePropertyAll<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5)))),
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: !context.watch<UserAuthProvider>().success,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black45),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      context.watch<UserAuthProvider>().message,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            color: Colors.red,
            height: 45,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Row(
                children: [
                  Text(
                    "HR Management System Version 0.0",
                    style: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    "Copyright © 2024",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
