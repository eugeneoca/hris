import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@Freezed()
class AuthModel with _$AuthModel {
  const factory AuthModel({UserModel? user, String? token}) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}

@Freezed()
class UserModel with _$UserModel {
  const factory UserModel(
      {int? id,
      String? username,
      RoleModel? role,
      DepartmentModel? department}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@Freezed()
class RoleModel with _$RoleModel {
  const factory RoleModel({String? token}) = _RoleModel;

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);
}

@Freezed()
class DepartmentModel with _$DepartmentModel {
  const factory DepartmentModel({String? token}) = _DepartmentModel;

  factory DepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentModelFromJson(json);
}
