import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mobilev2/local_db/shared_preferences/shared_preferences.dart';
import 'package:mobilev2/local_db/shared_preferences/shared_prefs_helper.dart';
import 'package:mobilev2/main.dart';
import 'package:mobilev2/network/network_models/divisions_model/divisions_model.dart';
import 'package:mobilev2/network/network_models/employees_model/employees_model.dart';
import 'package:mobilev2/network/network_models/production_values_model/production_values_model.dart';
import 'package:mobilev2/src/core/call_bloc_helper.dart';
import 'package:mobilev2/src/presentation/bloc/divisions_bloc/divisions_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/employees_bloc/employees_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/production_values_bloc/production_values_bloc.dart';
import 'package:mobilev2/src/presentation/views/widgets/custom_snackbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _selectedRowIndex;
  DivisionsModel? _selectedDivision;

  String? _payrollMonth;

  final ScrollController _scrollController = ScrollController();

  List<PayrollDateTable> listPayrollDateTables = [];

  final ValueNotifier<double> totalProductionValue = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _initializeDates();
  }

  _setPayrollMonth(DateTime? selectedFromDate, DateTime? selectedToDate) {
    setState(() {
      final lowerMonthDate = selectedFromDate!.month < selectedToDate!.month
          ? selectedFromDate
          : selectedToDate;
      _payrollMonth = DateFormat('MMMM').format(lowerMonthDate);
    });
  }

  Future<void> _initializeDates() async {
    String? payrollFromDate =
        await SharedPrefsUtil().getString(SharedPrefsHelper.payrollFromDate);

    String? payrollToDate =
        await SharedPrefsUtil().getString(SharedPrefsHelper.payrollToDate);

    if (payrollFromDate != null && payrollToDate != null) {
      setState(() {
        _setPayrollMonth(
            DateTime.parse(payrollFromDate), DateTime.parse(payrollToDate));
      });
    }
  }

  Future<DateTime?> _showDatePickerWithTitle(BuildContext context, String title,
      DateTime initialDate, DateTime firstDate, DateTime lastDate) {
    return showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showProductionValuesDialog(
      BuildContext context, PayrollDateTable payrollDateTable) async {
    if (payrollDateTable.selectedFromDate == null ||
        payrollDateTable.selectedToDate == null) return;

    productionValuesBloc.add(GetProductionValuesEvent(
        DateFormat('yyyy-MM-dd').format(payrollDateTable.selectedFromDate!),
        DateFormat('yyyy-MM-dd').format(payrollDateTable.selectedToDate!),
        _selectedDivision?.id));

    final List<DateTime> dates = [];
    DateTime currentDate = payrollDateTable.selectedFromDate!;
    while (currentDate.isBefore(payrollDateTable.selectedToDate!) ||
        currentDate.isAtSameMomentAs(payrollDateTable.selectedToDate!)) {
      dates.add(currentDate);
      currentDate = currentDate.add(const Duration(days: 1));
    }

    final List<Map<String, dynamic>> listDateValues = [];
    listDateValues.clear();

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Set Production Values",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.red),
                    ),
                  ),
                  const Row(
                    children: [
                      Expanded(child: Center(child: Text("Date"))),
                      Expanded(child: Center(child: Text("Production Value"))),
                    ],
                  ),
                  const Divider(),
                  BlocBuilder<ProductionValuesBloc, ProductionValuesState>(
                    builder: (context, state) {
                      if (state is SuccessGetProductionValuesState) {
                        List<ProductionValuesModel> listProductionValuesModel =
                            state.listProductionValuesModel;

                        totalProductionValue.value = 0;
                        for (ProductionValuesModel prodModel
                            in listProductionValuesModel) {
                          totalProductionValue.value += prodModel.value ?? 0;
                        }

                        return Column(
                          children: [
                            ...dates.map((date) {
                              // Find the matching ProductionValuesModel for the current date
                              ProductionValuesModel? matchingModel =
                                  listProductionValuesModel.firstWhere(
                                (model) =>
                                    DateFormat('yyyy-MM-dd')
                                        .format(DateTime.parse(model.date!)) ==
                                    DateFormat('yyyy-MM-dd').format(date),
                                orElse: () => const ProductionValuesModel(),
                              );

                              // Create a TextEditingController and initialize it with the value
                              TextEditingController controller =
                                  TextEditingController(
                                text: matchingModel.value?.toString() ?? '',
                              );

                              return Row(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(DateFormat('MM/dd/yyyy')
                                          .format(date)),
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: controller,
                                      decoration: const InputDecoration(
                                        hintText: "Enter value",
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9.]')),
                                      ],
                                      onChanged: (value) {
                                        int index = listDateValues.indexWhere(
                                            (element) =>
                                                element['date'] ==
                                                DateFormat('yyyy-MM-dd')
                                                    .format(date));

                                        if (index != -1) {
                                          listDateValues[index]['value'] =
                                              double.parse(value);
                                          listDateValues[index]['divisionid'] =
                                              _selectedDivision?.id;
                                        } else {
                                          listDateValues.add({
                                            'date': DateFormat('yyyy-MM-dd')
                                                .format(date),
                                            "divisionid": _selectedDivision?.id,
                                            'value': double.parse(value)
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        );
                      } else if (state is LoadingProductionValuesState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Close"),
                        ),
                        TextButton(
                          onPressed: () {
                            print(listDateValues);
                            productionValuesBloc.add(
                                CreateProductionValuesEvent(listDateValues));

                            Navigator.of(context).pop();
                          },
                          child: const Text("Save"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
            onPressed: () async {
              if (_selectedDivision != null) {
                await setPayrollDates();
              } else {
                CustomSnackbar().showErrorSnackbar(
                    MainApp.navigatorKey.currentContext!,
                    content: "Please highlight a division first.");
              }
            },
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
            onPressed: () {
              if (_selectedDivision != null &&
                  listPayrollDateTables.isNotEmpty &&
                  listPayrollDateTables
                          .where((e) => e.division?.id == _selectedDivision?.id)
                          .firstOrNull !=
                      null) {
                _showProductionValuesDialog(
                    context,
                    listPayrollDateTables
                        .where((e) => e.division?.id == _selectedDivision?.id)
                        .first);
              } else {
                CustomSnackbar().showErrorSnackbar(
                    MainApp.navigatorKey.currentContext!,
                    content: "Please highlight a division first.");
              }
            },
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
        const SizedBox(width: 30),
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
            onPressed: () {
              if (_selectedDivision != null &&
                  listPayrollDateTables.isNotEmpty &&
                  listPayrollDateTables
                          .where((e) => e.division?.id == _selectedDivision?.id)
                          .firstOrNull !=
                      null) {
                showDialogSummarizePayroll(listPayrollDateTables
                    .where((e) => e.division?.id == _selectedDivision?.id)
                    .first);
              } else {
                CustomSnackbar().showErrorSnackbar(
                    MainApp.navigatorKey.currentContext!,
                    content: "Please highlight a division first.");
              }
            },
            child: const Row(
              children: [
                Icon(
                  Icons.attach_money,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Summarize Payroll",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            )),
        const SizedBox(width: 20),
      ],
    );
  }

  Future<void> setPayrollDates() async {
    final DateTime? pickedFromDate = await _showDatePickerWithTitle(
      context,
      'Selecting Payroll From',
      DateTime.now(),
      DateTime(1900, 1),
      DateTime.now(),
    );
    if (pickedFromDate != null) {
      SharedPrefsUtil().storeString(
        SharedPrefsHelper.payrollFromDate,
        pickedFromDate.toString(),
      );

      final DateTime? pickedToDate = await _showDatePickerWithTitle(
        context,
        'Selecting Payroll To',
        pickedFromDate,
        pickedFromDate,
        DateTime.now(),
      );
      if (pickedToDate != null) {
        SharedPrefsUtil().storeString(
          SharedPrefsHelper.payrollToDate,
          pickedToDate.toString(),
        );

        setState(() {
          _setPayrollMonth(pickedFromDate, pickedToDate);

          listPayrollDateTables.clear();

          PayrollDateTable payrollDateTable = PayrollDateTable(
              division: _selectedDivision,
              selectedFromDate: pickedFromDate,
              selectedToDate: pickedToDate,
              payrollMonth: _payrollMonth);
          listPayrollDateTables.add(payrollDateTable);
        });
      }
    }
  }

  Future<dynamic> showDialogSummarizePayroll(
      PayrollDateTable payrollDateTable) {
    productionValuesBloc.add(GetProductionValuesEvent(
        DateFormat('yyyy-MM-dd').format(payrollDateTable.selectedFromDate!),
        DateFormat('yyyy-MM-dd').format(payrollDateTable.selectedToDate!),
        _selectedDivision?.id));

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ValueListenableBuilder(
            valueListenable: totalProductionValue,
            builder: (context, val, child) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              const Text(
                                "Payroll Summary",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red),
                              ),
                              Text(
                                "${payrollDateTable.selectedFromDate != null ? DateFormat('MM/dd/yyyy').format(payrollDateTable.selectedFromDate!) : "Not Set"} - ${payrollDateTable.selectedToDate != null ? DateFormat('MM/dd/yyyy').format(payrollDateTable.selectedToDate!) : "Not Set"}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "Total Production Value: Php ${totalProductionValue.value.toStringAsFixed(2)}",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                        Scrollbar(
                          thumbVisibility: true,
                          controller: _scrollController,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                              child: BlocBuilder<EmployeesBloc, EmployeesState>(
                                builder: (context, state) {
                                  if (state is SuccessGetEmployeesState) {
                                    List<EmployeesModel> listEmployees =
                                        state.listEmployeesModel;

                                    //TODO: MAKE DEDUCTIONS BASED ON ATTENDANCE
                                    double value = totalProductionValue.value /
                                        listEmployees.length;

                                    return DataTable(
                                      headingTextStyle: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      showCheckboxColumn: true,
                                      border: const TableBorder.symmetric(
                                        inside: BorderSide(width: 0.2),
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black38, width: 0.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      columns: const [
                                        DataColumn(
                                          numeric: true,
                                          label: Text("Last Name"),
                                        ),
                                        DataColumn(
                                          label: Text("First Name"),
                                        ),
                                        DataColumn(
                                          label: Text("Gross"),
                                        ),
                                        DataColumn(
                                          label: Text("Deduction"),
                                        ),
                                        DataColumn(
                                          label: Text("Net Income"),
                                        ),
                                      ],
                                      rows: listEmployees
                                          .map((e) => DataRow(
                                                cells: [
                                                  DataCell(
                                                    Text(e.lastName != null
                                                        ? e.lastName.toString()
                                                        : ""),
                                                  ),
                                                  DataCell(
                                                    Text(e.firstName != null
                                                        ? e.firstName.toString()
                                                        : ""),
                                                  ),
                                                  DataCell(
                                                    Text(value
                                                        .toStringAsFixed(2)),
                                                  ),
                                                  const DataCell(
                                                    Text("0"),
                                                  ),
                                                  DataCell(
                                                    Text(value
                                                        .toStringAsFixed(2)),
                                                  ),
                                                ],
                                              ))
                                          .toList(),
                                    );
                                  } else if (state is LoadingEmployeesState) {
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Close"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            });
      },
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
                      _selectedDivision = division;
                    });
                  },
                ),
                DataCell(
                  Text(division.name != null ? division.name.toString() : ""),
                  onTap: () {
                    setState(() {
                      _selectedRowIndex = index;
                      _selectedDivision = division;
                    });
                  },
                ),
                DataCell(
                  Text(
                    listPayrollDateTables.isNotEmpty &&
                            listPayrollDateTables
                                    .where((e) => e.division?.id == division.id)
                                    .firstOrNull !=
                                null
                        ? DateFormat('MM/dd/yyyy').format((listPayrollDateTables
                                .where((e) => e.division?.id == division.id)
                                .first)
                            .selectedFromDate!)
                        : "Not Set",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                DataCell(
                  Text(
                    listPayrollDateTables.isNotEmpty &&
                            listPayrollDateTables
                                    .where((e) => e.division?.id == division.id)
                                    .firstOrNull !=
                                null
                        ? DateFormat('MM/dd/yyyy').format((listPayrollDateTables
                                .where((e) => e.division?.id == division.id)
                                .first)
                            .selectedToDate!)
                        : "Not Set",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                DataCell(
                  Text(
                    listPayrollDateTables.isNotEmpty &&
                            listPayrollDateTables
                                    .where((e) => e.division?.id == division.id)
                                    .firstOrNull !=
                                null
                        ? (listPayrollDateTables
                                .where((e) => e.division?.id == division.id)
                                .first)
                            .payrollMonth!
                        : "Not Set",
                    style: const TextStyle(color: Colors.red),
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

class PayrollDateTable {
  final DivisionsModel? division;
  final DateTime? selectedFromDate;
  final DateTime? selectedToDate;
  final String? payrollMonth;
  PayrollDateTable(
      {required this.division,
      required this.selectedFromDate,
      required this.selectedToDate,
      required this.payrollMonth});
}
