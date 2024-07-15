import 'package:freezed_annotation/freezed_annotation.dart';
part 'timeinout_model.freezed.dart';
part 'timeinout_model.g.dart';

@Freezed()
class TimeInOutModel with _$TimeInOutModel {
  const factory TimeInOutModel(
      {int? userid,
      String? time,
      String? date,
      String? type,
      String? geolocation,
      String? imageUrl}) = _TimeInOutModel;

  factory TimeInOutModel.fromJson(Map<String, dynamic> json) =>
      _$TimeInOutModelFromJson(json);
}
