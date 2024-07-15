// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeinout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeInOutModelImpl _$$TimeInOutModelImplFromJson(Map<String, dynamic> json) =>
    _$TimeInOutModelImpl(
      userid: (json['userid'] as num?)?.toInt(),
      time: json['time'] as String?,
      date: json['date'] as String?,
      type: json['type'] as String?,
      geolocation: json['geolocation'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$TimeInOutModelImplToJson(
        _$TimeInOutModelImpl instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'time': instance.time,
      'date': instance.date,
      'type': instance.type,
      'geolocation': instance.geolocation,
      'imageUrl': instance.imageUrl,
    };
