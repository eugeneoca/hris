// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employees_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeesModel _$EmployeesModelFromJson(Map<String, dynamic> json) {
  return _EmployeesModel.fromJson(json);
}

/// @nodoc
mixin _$EmployeesModel {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "middle_name")
  String? get middleName => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get birthday => throw _privateConstructorUsedError;
  @JsonKey(name: "sss_number")
  String? get sssNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "pagibig_number")
  String? get pagibigNumber => throw _privateConstructorUsedError;
  String? get philHealth => throw _privateConstructorUsedError;
  @JsonKey(name: "tin_number")
  String? get tinNumber => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeesModelCopyWith<EmployeesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeesModelCopyWith<$Res> {
  factory $EmployeesModelCopyWith(
          EmployeesModel value, $Res Function(EmployeesModel) then) =
      _$EmployeesModelCopyWithImpl<$Res, EmployeesModel>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "middle_name") String? middleName,
      String? mobile,
      String? email,
      String? address,
      String? gender,
      String? birthday,
      @JsonKey(name: "sss_number") String? sssNumber,
      @JsonKey(name: "pagibig_number") String? pagibigNumber,
      String? philHealth,
      @JsonKey(name: "tin_number") String? tinNumber,
      UserModel? user});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$EmployeesModelCopyWithImpl<$Res, $Val extends EmployeesModel>
    implements $EmployeesModelCopyWith<$Res> {
  _$EmployeesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? sssNumber = freezed,
    Object? pagibigNumber = freezed,
    Object? philHealth = freezed,
    Object? tinNumber = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      sssNumber: freezed == sssNumber
          ? _value.sssNumber
          : sssNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pagibigNumber: freezed == pagibigNumber
          ? _value.pagibigNumber
          : pagibigNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      philHealth: freezed == philHealth
          ? _value.philHealth
          : philHealth // ignore: cast_nullable_to_non_nullable
              as String?,
      tinNumber: freezed == tinNumber
          ? _value.tinNumber
          : tinNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmployeesModelImplCopyWith<$Res>
    implements $EmployeesModelCopyWith<$Res> {
  factory _$$EmployeesModelImplCopyWith(_$EmployeesModelImpl value,
          $Res Function(_$EmployeesModelImpl) then) =
      __$$EmployeesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "middle_name") String? middleName,
      String? mobile,
      String? email,
      String? address,
      String? gender,
      String? birthday,
      @JsonKey(name: "sss_number") String? sssNumber,
      @JsonKey(name: "pagibig_number") String? pagibigNumber,
      String? philHealth,
      @JsonKey(name: "tin_number") String? tinNumber,
      UserModel? user});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$EmployeesModelImplCopyWithImpl<$Res>
    extends _$EmployeesModelCopyWithImpl<$Res, _$EmployeesModelImpl>
    implements _$$EmployeesModelImplCopyWith<$Res> {
  __$$EmployeesModelImplCopyWithImpl(
      _$EmployeesModelImpl _value, $Res Function(_$EmployeesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? mobile = freezed,
    Object? email = freezed,
    Object? address = freezed,
    Object? gender = freezed,
    Object? birthday = freezed,
    Object? sssNumber = freezed,
    Object? pagibigNumber = freezed,
    Object? philHealth = freezed,
    Object? tinNumber = freezed,
    Object? user = freezed,
  }) {
    return _then(_$EmployeesModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      birthday: freezed == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String?,
      sssNumber: freezed == sssNumber
          ? _value.sssNumber
          : sssNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      pagibigNumber: freezed == pagibigNumber
          ? _value.pagibigNumber
          : pagibigNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      philHealth: freezed == philHealth
          ? _value.philHealth
          : philHealth // ignore: cast_nullable_to_non_nullable
              as String?,
      tinNumber: freezed == tinNumber
          ? _value.tinNumber
          : tinNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeesModelImpl implements _EmployeesModel {
  const _$EmployeesModelImpl(
      {this.id,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "middle_name") this.middleName,
      this.mobile,
      this.email,
      this.address,
      this.gender,
      this.birthday,
      @JsonKey(name: "sss_number") this.sssNumber,
      @JsonKey(name: "pagibig_number") this.pagibigNumber,
      this.philHealth,
      @JsonKey(name: "tin_number") this.tinNumber,
      this.user});

  factory _$EmployeesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeesModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "middle_name")
  final String? middleName;
  @override
  final String? mobile;
  @override
  final String? email;
  @override
  final String? address;
  @override
  final String? gender;
  @override
  final String? birthday;
  @override
  @JsonKey(name: "sss_number")
  final String? sssNumber;
  @override
  @JsonKey(name: "pagibig_number")
  final String? pagibigNumber;
  @override
  final String? philHealth;
  @override
  @JsonKey(name: "tin_number")
  final String? tinNumber;
  @override
  final UserModel? user;

  @override
  String toString() {
    return 'EmployeesModel(id: $id, firstName: $firstName, lastName: $lastName, middleName: $middleName, mobile: $mobile, email: $email, address: $address, gender: $gender, birthday: $birthday, sssNumber: $sssNumber, pagibigNumber: $pagibigNumber, philHealth: $philHealth, tinNumber: $tinNumber, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.sssNumber, sssNumber) ||
                other.sssNumber == sssNumber) &&
            (identical(other.pagibigNumber, pagibigNumber) ||
                other.pagibigNumber == pagibigNumber) &&
            (identical(other.philHealth, philHealth) ||
                other.philHealth == philHealth) &&
            (identical(other.tinNumber, tinNumber) ||
                other.tinNumber == tinNumber) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      middleName,
      mobile,
      email,
      address,
      gender,
      birthday,
      sssNumber,
      pagibigNumber,
      philHealth,
      tinNumber,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeesModelImplCopyWith<_$EmployeesModelImpl> get copyWith =>
      __$$EmployeesModelImplCopyWithImpl<_$EmployeesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeesModelImplToJson(
      this,
    );
  }
}

abstract class _EmployeesModel implements EmployeesModel {
  const factory _EmployeesModel(
      {final int? id,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "middle_name") final String? middleName,
      final String? mobile,
      final String? email,
      final String? address,
      final String? gender,
      final String? birthday,
      @JsonKey(name: "sss_number") final String? sssNumber,
      @JsonKey(name: "pagibig_number") final String? pagibigNumber,
      final String? philHealth,
      @JsonKey(name: "tin_number") final String? tinNumber,
      final UserModel? user}) = _$EmployeesModelImpl;

  factory _EmployeesModel.fromJson(Map<String, dynamic> json) =
      _$EmployeesModelImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "middle_name")
  String? get middleName;
  @override
  String? get mobile;
  @override
  String? get email;
  @override
  String? get address;
  @override
  String? get gender;
  @override
  String? get birthday;
  @override
  @JsonKey(name: "sss_number")
  String? get sssNumber;
  @override
  @JsonKey(name: "pagibig_number")
  String? get pagibigNumber;
  @override
  String? get philHealth;
  @override
  @JsonKey(name: "tin_number")
  String? get tinNumber;
  @override
  UserModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$EmployeesModelImplCopyWith<_$EmployeesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
