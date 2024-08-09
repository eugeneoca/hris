import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:mobilev2/network/network_models/attendance_model.dart';
import 'package:mobilev2/src/core/shared/widgets/cache_image.dart';
import 'package:mobilev2/src/presentation/bloc/attendance_cubit/domain/cubit/attendance_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final listColumnName = ["First name", "Last Name", "Time", "Date", "Type", "Image"];
  bool isLoading = false;
  late ScrollController _scrollController;
  late File file;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        return Column(
          children: [
            AppDataTable(
              attendanceList: state.attendanceList,
              listColumnName: listColumnName,
              scrollController: _scrollController,
            ),
          ],
        );
      },
    );
  }
}

class AppDataTable extends StatelessWidget {
  const AppDataTable({
    super.key,
    required this.listColumnName,
    required this.scrollController,
    required this.attendanceList,
  });
  final ScrollController scrollController;
  final List<String> listColumnName;
  final List<AttendanceModel> attendanceList;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    return Scrollbar(
      interactive: true,
      trackVisibility: true,
      thumbVisibility: true,
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Container(
          margin: const EdgeInsets.only(top: 50),
          // width: 1000,
          width: responsive.isDesktop ? 1500 : 1000,

          child: DataTable(
            dataRowMaxHeight: 100,
            decoration: const BoxDecoration(),
            columns: listColumnName.map(
              (item) {
                return DataColumn(label: SizedBox(width: 100, child: Text(item)));
              },
            ).toList(),
            rows: attendanceList.map(
              (AttendanceModel employee) {
                return DataRow(cells: [
                  DataCell(Text(employee.firstName)),
                  DataCell(Text(employee.lateName)),
                  DataCell(Text(employee.time)),
                  DataCell(Text(employee.date)),
                  DataCell(Text(employee.type)),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ChachedImageNetwork(url: employee.image),
                    ),
                  ),
                ]);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
