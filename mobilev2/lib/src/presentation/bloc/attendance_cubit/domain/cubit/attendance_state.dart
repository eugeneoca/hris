part of 'attendance_cubit.dart';

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState({
    @Default(false) bool isLoading,
    @Default([]) List<AttendanceModel> attendanceList,
  }) = _AttendanceState;
}
