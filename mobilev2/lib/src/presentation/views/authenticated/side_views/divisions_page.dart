import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DivisionsPage extends StatelessWidget {
  const DivisionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "Company Divisions",
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              margin: const EdgeInsets.only(top: 25, bottom: 25),
              child: SingleChildScrollView(
                child: DataTable(
                  headingTextStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  showCheckboxColumn: true,
                  border: TableBorder.symmetric(
                      inside: const BorderSide(width: 0.2)),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black38, width: 0.5),
                      borderRadius: BorderRadius.circular(10)),
                  columns: const [
                    DataColumn(
                      numeric: true,
                      label: Text("ID"),
                    ),
                    DataColumn(
                      label: Text("Name"),
                    ),
                    DataColumn(
                      label: Text("Created By"),
                    ),
                    DataColumn(
                      label: Text("Created"),
                    ),
                    DataColumn(
                      label: Text("Updated"),
                    ),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(
                          Text("1"),
                        ),
                        DataCell(
                          Text("Bodega"),
                        ),
                        DataCell(
                          Text("Eugene Oca"),
                        ),
                        DataCell(
                          Text("Row 1 Col 1"),
                        ),
                        DataCell(
                          Text("Row 1 Col 1"),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: [
                        DataCell(
                          Text("2"),
                        ),
                        DataCell(
                          Text("Siliran"),
                        ),
                        DataCell(
                          Text("Eugene Oca"),
                        ),
                        DataCell(
                          Text("Row 1 Col 1"),
                        ),
                        DataCell(
                          Text("Row 1 Col 1"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
