import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobilev2/src/core/asset_helper.dart';
import 'package:mobilev2/src/core/call_bloc_helper.dart';
import 'package:mobilev2/src/core/constants.dart';
import 'package:mobilev2/src/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/home_page.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/settings_page.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/attendance_page.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/divisions_page.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/employees_page.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/integration_page.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/overview_page.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/payroll_page.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/ranks_page.dart';
import 'package:mobilev2/src/presentation/views/authenticated/side_views/salary_packages_page.dart';

class WrapperPage extends StatefulWidget {
  const WrapperPage({super.key});

  @override
  State<WrapperPage> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<WrapperPage> {
  final List<Widget> _pages = [
    // const OverviewPage(),
    const HomePage(),
    const DivisionsPage(),
    // const RanksPage(),
    // const SalaryPackagesPage(),
    const EmployeesPage(),
    // const AttendancePage(),
    // const PayrollPage(),
    // const IntegrationPage(),
    const SettingsPage()
  ];

  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("HRIS",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.red)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
        actions: const [TimeDisplayWidget()],
      ),
      body: Row(
        children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: MediaQuery.of(context).size.height),
              child: IntrinsicHeight(
                child: NavigationRail(
                  backgroundColor: Colors.white,
                  selectedIndex: _selectedIndex,
                  groupAlignment: 0.0,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: labelType,
                  destinations: [
                    // const NavigationRailDestination(
                    //   icon: Icon(
                    //     FontAwesomeIcons.chartPie,
                    //   ),
                    //   selectedIcon: Icon(
                    //     FontAwesomeIcons.chartPie,
                    //     color: Colors.red,
                    //   ),
                    //   label: Text('Overview'),
                    // ),
                    const NavigationRailDestination(
                        icon: Icon(
                          FontAwesomeIcons.home,
                        ),
                        selectedIcon: Icon(
                          FontAwesomeIcons.home,
                          color: Colors.red,
                        ),
                        label: Text('Home'),
                        padding: EdgeInsets.symmetric(vertical: 10)),
                    const NavigationRailDestination(
                        icon: Icon(
                          FontAwesomeIcons.userGroup,
                        ),
                        selectedIcon: Icon(
                          FontAwesomeIcons.userGroup,
                          color: Colors.red,
                        ),
                        label: Text('Divisions'),
                        padding: EdgeInsets.symmetric(vertical: 10)),
                    // const NavigationRailDestination(
                    //     icon: Icon(
                    //       FontAwesomeIcons.rankingStar,
                    //     ),
                    //     selectedIcon: Icon(
                    //       FontAwesomeIcons.rankingStar,
                    //       color: Colors.red,
                    //     ),
                    //     label: Text('Ranks'),
                    //     padding: EdgeInsets.symmetric(vertical: 10)),
                    // const NavigationRailDestination(
                    //     icon: Icon(
                    //       FontAwesomeIcons.boxesPacking,
                    //     ),
                    //     selectedIcon: Icon(
                    //       FontAwesomeIcons.boxesPacking,
                    //       color: Colors.red,
                    //     ),
                    //     label: Text(
                    //       'Salary\nPackages',
                    //       textAlign: TextAlign.center,
                    //     ),
                    //     padding: EdgeInsets.symmetric(vertical: 10)),
                    const NavigationRailDestination(
                        icon: Icon(
                          FontAwesomeIcons.users,
                        ),
                        selectedIcon: Icon(
                          FontAwesomeIcons.users,
                          color: Colors.red,
                        ),
                        label: Text('Employees'),
                        padding: EdgeInsets.symmetric(vertical: 10)),
                    // const NavigationRailDestination(
                    //     icon: Icon(
                    //       FontAwesomeIcons.calendarDays,
                    //     ),
                    //     selectedIcon: Icon(
                    //       FontAwesomeIcons.calendarDays,
                    //       color: Colors.red,
                    //     ),
                    //     label: Text('Attendance'),
                    //     padding: EdgeInsets.symmetric(vertical: 10)),
                    // const NavigationRailDestination(
                    //     icon: Icon(
                    //       FontAwesomeIcons.creditCard,
                    //     ),
                    //     selectedIcon: Icon(
                    //       FontAwesomeIcons.creditCard,
                    //       color: Colors.red,
                    //     ),
                    //     label: Text('Payroll'),
                    //     padding: EdgeInsets.symmetric(vertical: 10)),
                    // const NavigationRailDestination(
                    //     icon: Icon(
                    //       FontAwesomeIcons.mixer,
                    //     ),
                    //     selectedIcon: Icon(
                    //       FontAwesomeIcons.mixer,
                    //       color: Colors.red,
                    //     ),
                    //     label: Text('Integration'),
                    //     padding: EdgeInsets.symmetric(vertical: 10)),
                    NavigationRailDestination(
                      icon: SvgPicture.asset(
                        AssetHelper.settings,
                        color: Colors.black,
                      ),
                      selectedIcon: SvgPicture.asset(
                        AssetHelper.settings,
                        color: Colors.red,
                      ),
                      label: const Text('Settings'),
                    ),
                  ],
                  trailing: InkWell(
                    onTap: () => authBloc.add(const LogoutEvent()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const NavigationRailDestination(
                            icon: Icon(
                              FontAwesomeIcons.arrowRightFromBracket,
                            ),
                            selectedIcon: Icon(
                              FontAwesomeIcons.arrowRightFromBracket,
                              color: Colors.red,
                            ),
                            label: Text('Log Out'),
                          ).icon,
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Log Out'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}

class TimeDisplayWidget extends StatefulWidget {
  const TimeDisplayWidget({
    super.key,
  });

  @override
  State<TimeDisplayWidget> createState() => _TimeDisplayWidgetState();
}

class _TimeDisplayWidgetState extends State<TimeDisplayWidget> {
  String _formattedDateTime = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _formattedDateTime = formatDateTime(DateTime.now());
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _formattedDateTime = formatDateTime(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.calendar_month)),
          Text(
            _formattedDateTime,
          ),
        ],
      ),
    );
  }
}
