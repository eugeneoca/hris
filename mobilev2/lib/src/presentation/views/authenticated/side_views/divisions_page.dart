import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobilev2/network/network_models/divisions_model/divisions_model.dart';
import 'package:mobilev2/src/presentation/bloc/divisions_bloc/divisions_bloc.dart';

class DivisionsPage extends StatelessWidget {
  const DivisionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  "Divisions",
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
                child: BlocBuilder<DivisionsBloc, DivisionsState>(
                  builder: (context, state) {
                    if (state is SuccessGetDivisionsState) {
                      List<DivisionsModel> listDivisions =
                          state.listDivisionsModel;

                      return DataTable(
                          headingTextStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          showCheckboxColumn: true,
                          border: const TableBorder.symmetric(
                              inside: BorderSide(width: 0.2)),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black38, width: 0.5),
                              borderRadius: BorderRadius.circular(10)),
                          columns: const [
                            DataColumn(
                              numeric: true,
                              label: Text("ID"),
                            ),
                            DataColumn(
                              label: Text("Name"),
                            ),
                          ],
                          rows: listDivisions
                              .map((e) => DataRow(
                                    cells: [
                                      DataCell(
                                        Text(e.id != null
                                            ? e.id.toString()
                                            : ""),
                                      ),
                                      DataCell(
                                        Text(e.name != null
                                            ? e.name.toString()
                                            : ""),
                                      ),
                                    ],
                                  ))
                              .toList());
                    } else if (state is LoadingDivisionsState) {
                      return const Center(
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
