// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_values_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionValuesModelImpl _$$ProductionValuesModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionValuesModelImpl(
      id: (json['id'] as num?)?.toInt(),
      date: json['date'] as String?,
      divisionid: (json['divisionid'] as num?)?.toInt(),
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProductionValuesModelImplToJson(
        _$ProductionValuesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'divisionid': instance.divisionid,
      'value': instance.value,
    };
