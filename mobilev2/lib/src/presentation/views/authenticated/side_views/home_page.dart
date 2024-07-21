import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobilev2/network/network_models/divisions_model/divisions_model.dart';
import 'package:mobilev2/src/presentation/bloc/divisions_bloc/divisions_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _selectedRowIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 50, right: 50),
          height: 80,
          color: Colors.white,
          child: const Text(
            "Home",
            style: TextStyle(
              fontSize: 26,
              color: Colors.black45,
            ),
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

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildDataTable(listDivisions),
                        const SizedBox(height: 20),
                        buildButtons()
                      ],
                    );
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
    );
  }

  Row buildButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ButtonStyle(
              surfaceTintColor:
                  const WidgetStatePropertyAll<Color>(Colors.white),
              backgroundColor:
                  const WidgetStatePropertyAll<Color>(Colors.white),
              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(5))),
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Icon(
                  Icons.date_range,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Set Payroll Dates",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            )),
        const SizedBox(width: 30),
        ElevatedButton(
            style: ButtonStyle(
              surfaceTintColor: const WidgetStatePropertyAll<Color>(Colors.red),
              backgroundColor: const WidgetStatePropertyAll<Color>(Colors.red),
              shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(5))),
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Icon(
                  Icons.money_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Set Production Values",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget buildDataTable(List<DivisionsModel> listDivisions) {
    return SingleChildScrollView(
      child: DataTable(
        headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        showCheckboxColumn: true,
        border: const TableBorder.symmetric(inside: BorderSide(width: 0.2)),
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
            label: Text("From"),
          ),
          DataColumn(
            label: Text("To"),
          ),
          DataColumn(
            label: Text("Payroll Month"),
          ),
        ],
        rows: [
          ...listDivisions.asMap().entries.map((entry) {
            int index = entry.key;
            DivisionsModel division = entry.value;

            return DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (index == _selectedRowIndex) {
                  return Colors.red.withOpacity(0.2);
                }
                return null;
              }),
              cells: [
                DataCell(
                  Text(division.id != null ? division.id.toString() : ""),
                  onTap: () {
                    setState(() {
                      _selectedRowIndex = index;
                    });
                  },
                ),
                DataCell(
                  Text(division.name != null ? division.name.toString() : ""),
                  onTap: () {
                    setState(() {
                      _selectedRowIndex = index;
                    });
                  },
                ),
                const DataCell(
                  Text(
                    "Not Set",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const DataCell(
                  Text(
                    "Not Set",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const DataCell(
                  Text(
                    "Not Set",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
