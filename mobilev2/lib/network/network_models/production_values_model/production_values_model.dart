import 'package:freezed_annotation/freezed_annotation.dart';

part 'production_values_model.freezed.dart';
part 'production_values_model.g.dart';

@Freezed()
class ProductionValuesModel with _$ProductionValuesModel {
  const factory ProductionValuesModel(
      {int? id,
      String? date,
      int? divisionid,
      double? value}) = _ProductionValuesModel;

  factory ProductionValuesModel.fromJson(Map<String, dynamic> json) =>
      _$ProductionValuesModelFromJson(json);
}
