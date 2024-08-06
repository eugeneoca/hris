// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'production_values_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductionValuesModel _$ProductionValuesModelFromJson(
    Map<String, dynamic> json) {
  return _ProductionValuesModel.fromJson(json);
}

/// @nodoc
mixin _$ProductionValuesModel {
  int? get id => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  int? get divisionid => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductionValuesModelCopyWith<ProductionValuesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductionValuesModelCopyWith<$Res> {
  factory $ProductionValuesModelCopyWith(ProductionValuesModel value,
          $Res Function(ProductionValuesModel) then) =
      _$ProductionValuesModelCopyWithImpl<$Res, ProductionValuesModel>;
  @useResult
  $Res call({int? id, String? date, int? divisionid, double? value});
}

/// @nodoc
class _$ProductionValuesModelCopyWithImpl<$Res,
        $Val extends ProductionValuesModel>
    implements $ProductionValuesModelCopyWith<$Res> {
  _$ProductionValuesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? divisionid = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      divisionid: freezed == divisionid
          ? _value.divisionid
          : divisionid // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductionValuesModelImplCopyWith<$Res>
    implements $ProductionValuesModelCopyWith<$Res> {
  factory _$$ProductionValuesModelImplCopyWith(
          _$ProductionValuesModelImpl value,
          $Res Function(_$ProductionValuesModelImpl) then) =
      __$$ProductionValuesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? date, int? divisionid, double? value});
}

/// @nodoc
class __$$ProductionValuesModelImplCopyWithImpl<$Res>
    extends _$ProductionValuesModelCopyWithImpl<$Res,
        _$ProductionValuesModelImpl>
    implements _$$ProductionValuesModelImplCopyWith<$Res> {
  __$$ProductionValuesModelImplCopyWithImpl(_$ProductionValuesModelImpl _value,
      $Res Function(_$ProductionValuesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? date = freezed,
    Object? divisionid = freezed,
    Object? value = freezed,
  }) {
    return _then(_$ProductionValuesModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      divisionid: freezed == divisionid
          ? _value.divisionid
          : divisionid // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductionValuesModelImpl implements _ProductionValuesModel {
  const _$ProductionValuesModelImpl(
      {this.id, this.date, this.divisionid, this.value});

  factory _$ProductionValuesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductionValuesModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? date;
  @override
  final int? divisionid;
  @override
  final double? value;

  @override
  String toString() {
    return 'ProductionValuesModel(id: $id, date: $date, divisionid: $divisionid, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductionValuesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.divisionid, divisionid) ||
                other.divisionid == divisionid) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, divisionid, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductionValuesModelImplCopyWith<_$ProductionValuesModelImpl>
      get copyWith => __$$ProductionValuesModelImplCopyWithImpl<
          _$ProductionValuesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductionValuesModelImplToJson(
      this,
    );
  }
}

abstract class _ProductionValuesModel implements ProductionValuesModel {
  const factory _ProductionValuesModel(
      {final int? id,
      final String? date,
      final int? divisionid,
      final double? value}) = _$ProductionValuesModelImpl;

  factory _ProductionValuesModel.fromJson(Map<String, dynamic> json) =
      _$ProductionValuesModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get date;
  @override
  int? get divisionid;
  @override
  double? get value;
  @override
  @JsonKey(ignore: true)
  _$$ProductionValuesModelImplCopyWith<_$ProductionValuesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
