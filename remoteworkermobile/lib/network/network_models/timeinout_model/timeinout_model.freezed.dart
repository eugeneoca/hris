// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeinout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeInOutModel _$TimeInOutModelFromJson(Map<String, dynamic> json) {
  return _TimeInOutModel.fromJson(json);
}

/// @nodoc
mixin _$TimeInOutModel {
  int? get userid => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get geolocation => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeInOutModelCopyWith<TimeInOutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeInOutModelCopyWith<$Res> {
  factory $TimeInOutModelCopyWith(
          TimeInOutModel value, $Res Function(TimeInOutModel) then) =
      _$TimeInOutModelCopyWithImpl<$Res, TimeInOutModel>;
  @useResult
  $Res call(
      {int? userid,
      String? time,
      String? date,
      String? type,
      String? geolocation,
      String? imageUrl});
}

/// @nodoc
class _$TimeInOutModelCopyWithImpl<$Res, $Val extends TimeInOutModel>
    implements $TimeInOutModelCopyWith<$Res> {
  _$TimeInOutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userid = freezed,
    Object? time = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? geolocation = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userid: freezed == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeInOutModelImplCopyWith<$Res>
    implements $TimeInOutModelCopyWith<$Res> {
  factory _$$TimeInOutModelImplCopyWith(_$TimeInOutModelImpl value,
          $Res Function(_$TimeInOutModelImpl) then) =
      __$$TimeInOutModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? userid,
      String? time,
      String? date,
      String? type,
      String? geolocation,
      String? imageUrl});
}

/// @nodoc
class __$$TimeInOutModelImplCopyWithImpl<$Res>
    extends _$TimeInOutModelCopyWithImpl<$Res, _$TimeInOutModelImpl>
    implements _$$TimeInOutModelImplCopyWith<$Res> {
  __$$TimeInOutModelImplCopyWithImpl(
      _$TimeInOutModelImpl _value, $Res Function(_$TimeInOutModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userid = freezed,
    Object? time = freezed,
    Object? date = freezed,
    Object? type = freezed,
    Object? geolocation = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$TimeInOutModelImpl(
      userid: freezed == userid
          ? _value.userid
          : userid // ignore: cast_nullable_to_non_nullable
              as int?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      geolocation: freezed == geolocation
          ? _value.geolocation
          : geolocation // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeInOutModelImpl implements _TimeInOutModel {
  const _$TimeInOutModelImpl(
      {this.userid,
      this.time,
      this.date,
      this.type,
      this.geolocation,
      this.imageUrl});

  factory _$TimeInOutModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeInOutModelImplFromJson(json);

  @override
  final int? userid;
  @override
  final String? time;
  @override
  final String? date;
  @override
  final String? type;
  @override
  final String? geolocation;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'TimeInOutModel(userid: $userid, time: $time, date: $date, type: $type, geolocation: $geolocation, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeInOutModelImpl &&
            (identical(other.userid, userid) || other.userid == userid) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userid, time, date, type, geolocation, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeInOutModelImplCopyWith<_$TimeInOutModelImpl> get copyWith =>
      __$$TimeInOutModelImplCopyWithImpl<_$TimeInOutModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeInOutModelImplToJson(
      this,
    );
  }
}

abstract class _TimeInOutModel implements TimeInOutModel {
  const factory _TimeInOutModel(
      {final int? userid,
      final String? time,
      final String? date,
      final String? type,
      final String? geolocation,
      final String? imageUrl}) = _$TimeInOutModelImpl;

  factory _TimeInOutModel.fromJson(Map<String, dynamic> json) =
      _$TimeInOutModelImpl.fromJson;

  @override
  int? get userid;
  @override
  String? get time;
  @override
  String? get date;
  @override
  String? get type;
  @override
  String? get geolocation;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$TimeInOutModelImplCopyWith<_$TimeInOutModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
