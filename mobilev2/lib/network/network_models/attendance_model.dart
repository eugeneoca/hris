// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
class AttendanceModel with _$AttendanceModel {
  const factory AttendanceModel({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "late_name") required String lateName,
    @JsonKey(name: "time") required String time,
    @JsonKey(name: "date") required String date,
    @JsonKey(name: "type") required String type,
    @JsonKey(name: "image") required String image,
  }) = _AttendanceModel;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => _$AttendanceModelFromJson(json);
}
