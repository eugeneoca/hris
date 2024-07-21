import 'package:freezed_annotation/freezed_annotation.dart';
part 'divisions_model.freezed.dart';
part 'divisions_model.g.dart';

@Freezed()
class DivisionsModel with _$DivisionsModel {
  const factory DivisionsModel({int? id, String? name}) = _DivisionsModel;

  factory DivisionsModel.fromJson(Map<String, dynamic> json) =>
      _$DivisionsModelFromJson(json);
}
