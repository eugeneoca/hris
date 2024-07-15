import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final TextEditingController _positionController = TextEditingController();

  String? _selectedCity;
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
                    value: _selectedCity,
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
                  // DropdownButtonFormField<String>(
                  //   value: _selectedCity,
                  //   hint: const Text('Select City'),
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       _selectedCity = newValue;
                  //     });
                  //   },
                  //   items: _cities.map((String city) {
                  //     return DropdownMenuItem<String>(
                  //       value: city,
                  //       child: Text(city),
                  //     );
                  //   }).toList(),
                  // ),
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
                      label: Text("Rank"),
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
                          Text("1"),
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
                          Text("2"),
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
