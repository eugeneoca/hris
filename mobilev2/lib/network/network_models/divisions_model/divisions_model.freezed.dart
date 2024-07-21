// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'divisions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DivisionsModel _$DivisionsModelFromJson(Map<String, dynamic> json) {
  return _DivisionsModel.fromJson(json);
}

/// @nodoc
mixin _$DivisionsModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DivisionsModelCopyWith<DivisionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DivisionsModelCopyWith<$Res> {
  factory $DivisionsModelCopyWith(
          DivisionsModel value, $Res Function(DivisionsModel) then) =
      _$DivisionsModelCopyWithImpl<$Res, DivisionsModel>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$DivisionsModelCopyWithImpl<$Res, $Val extends DivisionsModel>
    implements $DivisionsModelCopyWith<$Res> {
  _$DivisionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DivisionsModelImplCopyWith<$Res>
    implements $DivisionsModelCopyWith<$Res> {
  factory _$$DivisionsModelImplCopyWith(_$DivisionsModelImpl value,
          $Res Function(_$DivisionsModelImpl) then) =
      __$$DivisionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$DivisionsModelImplCopyWithImpl<$Res>
    extends _$DivisionsModelCopyWithImpl<$Res, _$DivisionsModelImpl>
    implements _$$DivisionsModelImplCopyWith<$Res> {
  __$$DivisionsModelImplCopyWithImpl(
      _$DivisionsModelImpl _value, $Res Function(_$DivisionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$DivisionsModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DivisionsModelImpl implements _DivisionsModel {
  const _$DivisionsModelImpl({this.id, this.name});

  factory _$DivisionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DivisionsModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'DivisionsModel(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DivisionsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DivisionsModelImplCopyWith<_$DivisionsModelImpl> get copyWith =>
      __$$DivisionsModelImplCopyWithImpl<_$DivisionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DivisionsModelImplToJson(
      this,
    );
  }
}

abstract class _DivisionsModel implements DivisionsModel {
  const factory _DivisionsModel({final int? id, final String? name}) =
      _$DivisionsModelImpl;

  factory _DivisionsModel.fromJson(Map<String, dynamic> json) =
      _$DivisionsModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$DivisionsModelImplCopyWith<_$DivisionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
