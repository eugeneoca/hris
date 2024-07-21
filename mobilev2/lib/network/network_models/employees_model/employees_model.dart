import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilev2/network/network_models/auth_model/auth_model.dart';
part 'employees_model.freezed.dart';
part 'employees_model.g.dart';

@Freezed()
class EmployeesModel with _$EmployeesModel {
  const factory EmployeesModel(
      {int? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "middle_name") String? middleName,
      String? mobile,
      String? email,
      String? address,
      String? gender,
      String? birthday,
      @JsonKey(name: "sss_number") String? sssNumber,
      @JsonKey(name: "pagibig_number") String? pagibigNumber,
      String? philHealth,
      @JsonKey(name: "tin_number") String? tinNumber,
      UserModel? user}) = _EmployeesModel;

  factory EmployeesModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeesModelFromJson(json);
}
