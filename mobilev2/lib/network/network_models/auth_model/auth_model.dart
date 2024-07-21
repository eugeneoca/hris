import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobilev2/network/network_models/divisions_model/divisions_model.dart';
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
      RolesModel? role,
      DivisionsModel? division}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@Freezed()
class RolesModel with _$RolesModel {
  const factory RolesModel({int? id, String? name}) = _RolesModel;

  factory RolesModel.fromJson(Map<String, dynamic> json) =>
      _$RolesModelFromJson(json);
}
