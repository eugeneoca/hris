import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/colors.dart';

class Integrations extends StatefulWidget {
  const Integrations({super.key});

  @override
  State<Integrations> createState() => _IntegrationsState();
}

class _IntegrationsState extends State<Integrations> {
  @override
  Widget build(BuildContext context) {
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
                      child: Row(
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            onPressed: () {
                              //Navigator.pushReplacementNamed(context, "/dashboard");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  clipBehavior: Clip.antiAlias,
                                  margin: EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width - 320,
                                    right: 20,
                                    bottom: 20,
                                  ),
                                  backgroundColor: Colors.green,
                                  //duration: const Duration(seconds: 5),
                                  showCloseIcon: true,
                                  behavior: SnackBarBehavior.floating,
                                  content: const Text("Connected!"),
                                ),
                              );
                            },
                            child: const Text(
                              "Connect",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
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
                                  "Connect",
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
        Positioned(
          top: 300,
          left: 300,
          child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      actions: [
                        ElevatedButton(onPressed: () {}, child: Text("data"))
                      ],
                      title: Text("ZKTeco Login"),
                      content: Text("Body"),
                    );
                  });
            },
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
