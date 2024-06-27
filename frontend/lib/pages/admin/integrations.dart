import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/api_url.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/providers/user_provider.dart';
import 'package:frontend/providers/zkteco_provider.dart';
import 'package:frontend/widgets/user_field.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Integrations extends StatefulWidget {
  const Integrations({super.key});

  @override
  State<Integrations> createState() => _IntegrationsState();
}

class _IntegrationsState extends State<Integrations> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    final zkinfo = context.read<ZKUserProvider>();

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.3, color: Colors.black45),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                FontAwesomeIcons.fingerprint,
                                size: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: primaryColor,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)))),
                                              onPressed: () async => {
                                                await http
                                                    .post(
                                                        Uri.parse(
                                                            "$apiURL/zkteco/auth"),
                                                        headers: <String,
                                                            String>{
                                                          'Content-Type':
                                                              'application/json; charset=UTF-8',
                                                          'Authorization':
                                                              'Bearer ${Provider.of<UserAuthProvider>(context, listen: false).token}'
                                                        },
                                                        body: jsonEncode({
                                                          "username":
                                                              usernameController
                                                                  .text,
                                                          "password":
                                                              passwordController
                                                                  .text
                                                        }))
                                                    .then((res) => {
                                                          setState(() {
                                                            isError = false;
                                                          }),
                                                          if (res.statusCode ==
                                                              201)
                                                            {
                                                              Provider.of<ZKUserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .connected(),
                                                              Provider.of<ZKUserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .setDeviceName(
                                                                      jsonDecode(res.body)["info"]
                                                                              [
                                                                              "alias"]
                                                                          .toString()),
                                                              Provider.of<ZKUserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .setFirmwareVersion(
                                                                      jsonDecode(res.body)["info"]
                                                                              [
                                                                              "fw_ver"]
                                                                          .toString()),
                                                              Provider.of<ZKUserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .setSerialNumber(
                                                                      jsonDecode(res.body)["info"]
                                                                              [
                                                                              "sn"]
                                                                          .toString()),
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  left: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      320,
                                                                  right: 20,
                                                                  bottom: 70,
                                                                ),
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                showCloseIcon:
                                                                    true,
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                content: const Text(
                                                                    "Login successful."),
                                                              )),
                                                              Navigator.pop(
                                                                  context)
                                                            }
                                                          else
                                                            {
                                                              Provider.of<ZKUserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .disconnected(),
                                                              setState(() {
                                                                isError = true;
                                                              }),
                                                              ScaffoldMessenger
                                                                      .of(
                                                                          context)
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                margin:
                                                                    EdgeInsets
                                                                        .only(
                                                                  left: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      320,
                                                                  right: 20,
                                                                  bottom: 70,
                                                                ),
                                                                backgroundColor:
                                                                    Colors.red,
                                                                showCloseIcon:
                                                                    true,
                                                                behavior:
                                                                    SnackBarBehavior
                                                                        .floating,
                                                                content: Text(jsonDecode(res
                                                                            .body)
                                                                        .toString()
                                                                        .contains(
                                                                            "message")
                                                                    ? jsonDecode(
                                                                            res.body)[
                                                                        "message"]
                                                                    : "Login Failed."),
                                                              ))
                                                            }
                                                        })
                                              },
                                              child: const Text(
                                                "Connect",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                          title: const Text("ZKTeco Login"),
                                          content: Container(
                                            padding: const EdgeInsets.all(8),
                                            width: 400,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                UserField(
                                                    hintText: "Username",
                                                    isError: isError,
                                                    controller:
                                                        usernameController),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                UserField(
                                                    hintText: "Password",
                                                    isError: isError,
                                                    isPassword: true,
                                                    controller:
                                                        passwordController),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: const Text(
                                  "Connect Biometric",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: Provider.of<ZKUserProvider>(context,
                                    listen: false)
                                .isConnected,
                            child: const Divider(
                              height: 30,
                              thickness: 0.5,
                            ),
                          ),
                          Visibility(
                            visible: Provider.of<ZKUserProvider>(context,
                                    listen: false)
                                .isConnected,
                            child: Padding(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Device Name:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    zkinfo.deviceName,
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: Provider.of<ZKUserProvider>(context,
                                    listen: false)
                                .isConnected,
                            child: Padding(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Serial Number:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    zkinfo.serialNumber,
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: Provider.of<ZKUserProvider>(context,
                                    listen: false)
                                .isConnected,
                            child: Padding(
                              padding: EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Firmware Version:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    zkinfo.firmwareVersion,
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.3, color: Colors.black45),
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                FontAwesomeIcons.commentSms,
                                size: 30,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                onPressed: () {
                                  //Navigator.pushReplacementNamed(context, "/dashboard");
                                },
                                child: const Text(
                                  "Connect SMS",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            height: 30,
                            thickness: 0.5,
                          ),
                          const Text(
                            "Connected: No",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            "Device Port: N/A",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            "Available SIM Cards: 0",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Text(
                            "Signal Strength: N/A",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
