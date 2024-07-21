import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobilev2/network/network_models/auth_model/auth_model.dart';
import 'package:mobilev2/network/network_models/divisions_model/divisions_model.dart';
import 'package:mobilev2/network/network_models/employees_model/employees_model.dart';
import 'package:mobilev2/src/core/call_bloc_helper.dart';
import 'package:mobilev2/src/presentation/bloc/divisions_bloc/divisions_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/employees_bloc/employees_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/roles_bloc/roles_bloc.dart';

class EmployeesPage extends StatefulWidget {
  const EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => _EmployeesPageState();
}

class _EmployeesPageState extends State<EmployeesPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _sssnumController = TextEditingController();
  final TextEditingController _pagibignumController = TextEditingController();
  final TextEditingController _philhealthnumController =
      TextEditingController();
  final TextEditingController _tinnumController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  DivisionsModel? _selectedDivision;

  RolesModel? _selectedRole;

  String? _selectedGender;

  final List<String> _countries = ['USA', 'Canada', 'Mexico'];
  final List<String> _cities = ['New York', 'Toronto', 'Mexico City'];
  final List<String> _genders = ["Male", "Female", "Others"];

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdayController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width *
                0.8, // Adjust the width as needed
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Employee',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(hintText: 'First Name'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _middleNameController,
                    decoration: const InputDecoration(hintText: 'Middle Name'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(hintText: 'Last Name'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _mobileController,
                    decoration: const InputDecoration(hintText: 'Mobile'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _addressController,
                    decoration: const InputDecoration(hintText: 'Address'),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    hint: const Text('Gender'),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGender = newValue;
                      });
                    },
                    items: _genders.map((String gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: AbsorbPointer(
                      child: TextField(
                        controller: _birthdayController,
                        decoration:
                            const InputDecoration(hintText: 'Birth Date'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _sssnumController,
                    decoration: const InputDecoration(hintText: 'SSS Number'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _pagibignumController,
                    decoration:
                        const InputDecoration(hintText: 'Pag Ibig Number'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _philhealthnumController,
                    decoration:
                        const InputDecoration(hintText: 'Philhealth Number'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _tinnumController,
                    decoration: const InputDecoration(hintText: 'Tin Number'),
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<DivisionsBloc, DivisionsState>(
                    builder: (context, state) {
                      if (state is SuccessGetDivisionsState) {
                        List<DivisionsModel> listDivisions =
                            state.listDivisionsModel;

                        return DropdownButtonFormField<DivisionsModel>(
                          value: _selectedDivision,
                          hint: const Text('Select Division'),
                          onChanged: (DivisionsModel? newValue) {
                            setState(() {
                              _selectedDivision = newValue;
                            });
                          },
                          items: listDivisions.map((DivisionsModel division) {
                            return DropdownMenuItem<DivisionsModel>(
                              value: division,
                              child: Text(division.name!),
                            );
                          }).toList(),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                  const SizedBox(height: 8),
                  BlocBuilder<RolesBloc, RolesState>(
                    builder: (context, state) {
                      if (state is SuccessGetRolesState) {
                        List<RolesModel> listRoles = state.listRolesModel;

                        return DropdownButtonFormField<RolesModel>(
                          value: _selectedRole,
                          hint: const Text('Select Role'),
                          onChanged: (RolesModel? newValue) {
                            setState(() {
                              _selectedRole = newValue;
                            });
                          },
                          items: listRoles.map((RolesModel role) {
                            return DropdownMenuItem<RolesModel>(
                              value: role,
                              child: Text(role.name!),
                            );
                          }).toList(),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(hintText: 'Username'),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(hintText: 'Password'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          employeesBloc.add(CreateEmployeesEvent(
                              _firstNameController.text,
                              _middleNameController.text,
                              _lastNameController.text,
                              _mobileController.text,
                              _emailController.text,
                              _addressController.text,
                              _selectedGender,
                              _birthdayController.text,
                              _sssnumController.text,
                              _pagibignumController.text,
                              _philhealthnumController.text,
                              _tinnumController.text,
                              _selectedRole!.id,
                              _selectedDivision!.id,
                              _usernameController.text,
                              _passwordController.text));

                          Navigator.of(context).pop();
                        },
                      ),
                    ],
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
  void initState() {
    super.initState();
  }

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
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              margin: const EdgeInsets.only(top: 25, bottom: 25),
              child: Scrollbar(
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

                          return DataTable(
                            headingTextStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            showCheckboxColumn: true,
                            border: const TableBorder.symmetric(
                              inside: BorderSide(width: 0.2),
                            ),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black38, width: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            columns: const [
                              DataColumn(
                                numeric: true,
                                label: Text("First Name"),
                              ),
                              DataColumn(
                                label: Text("Last Name"),
                              ),
                              DataColumn(
                                label: Text("Middle Name"),
                              ),
                              DataColumn(
                                label: Text("Mobile"),
                              ),
                              DataColumn(
                                label: Text("Email"),
                              ),
                              DataColumn(
                                label: Text("Address"),
                              ),
                              DataColumn(
                                label: Text("Gender"),
                              ),
                              DataColumn(
                                label: Text("Birthday"),
                              ),
                              DataColumn(
                                label: Text("SSS Number"),
                              ),
                              DataColumn(
                                label: Text("Pagibig Number"),
                              ),
                              DataColumn(
                                label: Text("Philhealth"),
                              ),
                              DataColumn(
                                label: Text("TIN Number"),
                              ),
                            ],
                            rows: listEmployees
                                .map((e) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(e.firstName != null
                                              ? e.firstName.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.lastName != null
                                              ? e.lastName.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.middleName != null
                                              ? e.middleName.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.mobile != null
                                              ? e.mobile.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.email != null
                                              ? e.email.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.address != null
                                              ? e.address.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.gender != null
                                              ? e.gender.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.birthday != null
                                              ? e.birthday.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.sssNumber != null
                                              ? e.sssNumber.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.pagibigNumber != null
                                              ? e.pagibigNumber.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.philHealth != null
                                              ? e.philHealth.toString()
                                              : ""),
                                        ),
                                        DataCell(
                                          Text(e.tinNumber != null
                                              ? e.tinNumber.toString()
                                              : ""),
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
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => _showCustomDialog(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
