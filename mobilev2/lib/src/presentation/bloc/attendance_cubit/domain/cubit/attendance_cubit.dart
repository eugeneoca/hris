import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilev2/network/network_models/attendance_model.dart';

part 'attendance_state.dart';
part 'attendance_cubit.freezed.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(const AttendanceState()) {
    _getAttandanceData();
  }

  void _getAttandanceData() async {
    final getData = await rootBundle.loadString("assets/mock_data/attendace_mock.json");
    final List<dynamic> getList = jsonDecode(getData);
    List<AttendanceModel> listofAttendance = getList
        .map(
          (employee) => AttendanceModel.fromJson(employee),
        )
        .toList();
    debugPrint("listofAttendance:$listofAttendance");
    emit(state.copyWith(attendanceList: listofAttendance));
  }
}
