import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/constants/colors.dart';
import 'package:frontend/pages/admin/divisions.dart';
import 'package:frontend/pages/admin/employees.dart';
import 'package:frontend/pages/admin/integrations.dart';
import 'package:frontend/pages/admin/overview.dart';
import 'package:frontend/pages/admin/ranks.dart';
import 'package:frontend/pages/admin/salary_packages.dart';
import 'package:frontend/widgets/navigation_item.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // final navigationItemsData = AdminMenuItemsData(); // TODO: IMPLEMENT MODEL BASED DATA

  int selectedPage = 0;

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            color: primaryColor,
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 60,
                ),
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(0);
                    setState(() {
                      selectedPage = 0;
                    });
                  },
                  child: NavigationItem(
                    title: "Overview",
                    icon: FontAwesomeIcons.chartPie,
                    color: selectedPage == 0 ? Colors.white : selectedColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(1);
                    setState(() {
                      selectedPage = 1;
                    });
                  },
                  child: NavigationItem(
                    title: "Divisions",
                    icon: FontAwesomeIcons.userGroup,
                    color: selectedPage == 1 ? Colors.white : selectedColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(2);
                    setState(() {
                      selectedPage = 2;
                    });
                  },
                  child: NavigationItem(
                    title: "Ranks",
                    icon: FontAwesomeIcons.rankingStar,
                    color: selectedPage == 2 ? Colors.white : selectedColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(3);
                    setState(() {
                      selectedPage = 3;
                    });
                  },
                  child: NavigationItem(
                    title: "Salary Packages",
                    icon: FontAwesomeIcons.boxesPacking,
                    color: selectedPage == 3 ? Colors.white : selectedColor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      pageController.jumpToPage(4);
                      setState(() {
                        selectedPage = 4;
                      });
                    });
                  },
                  child: NavigationItem(
                    title: "Employees",
                    icon: FontAwesomeIcons.users,
                    color: selectedPage == 4 ? Colors.white : selectedColor,
                  ),
                ),
                const NavigationItem(
                  title: "Attendance",
                  icon: FontAwesomeIcons.calendarDays,
                  color: selectedColor,
                ),
                const NavigationItem(
                  title: "Payroll",
                  icon: FontAwesomeIcons.creditCard,
                  color: selectedColor,
                ),
                GestureDetector(
                  onTap: () {
                    pageController.jumpToPage(5);
                    setState(() {
                      selectedPage = 5;
                    });
                  },
                  child: NavigationItem(
                    title: "Integration",
                    icon: FontAwesomeIcons.mixer,
                    color: selectedPage == 5 ? Colors.white : selectedColor,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  child: const NavigationItem(
                    title: "Logout",
                    icon: FontAwesomeIcons.arrowRightFromBracket,
                    color: selectedColor,
                    flip: true,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                Overview(),
                Divisions(),
                Ranks(),
                SalaryPackages(),
                Employees(),
                Integrations()
              ],
            ),
          )
        ],
      ),
    ));
  }
}
