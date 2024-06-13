import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/colors.dart';

class Employees extends StatefulWidget {
  const Employees({super.key});

  @override
  State<Employees> createState() => _EmployeesState();
}

class _EmployeesState extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            height: 80,
            color: Colors.white,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Employees",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.black45,
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
                        prefixIconColor: Colors.black26,
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        filled: false,
                        hintText: "Search"),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0.5,
            indent: 50,
            endIndent: 50,
          ),
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
            child: const Row(
              children: [
                Spacer(),
                Icon(
                  FontAwesomeIcons.listUl,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  FontAwesomeIcons.borderAll,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
