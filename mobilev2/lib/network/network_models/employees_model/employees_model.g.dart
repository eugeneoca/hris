// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeesModelImpl _$$EmployeesModelImplFromJson(Map<String, dynamic> json) =>
    _$EmployeesModelImpl(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      middleName: json['middle_name'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      birthday: json['birthday'] as String?,
      sssNumber: json['sss_number'] as String?,
      pagibigNumber: json['pagibig_number'] as String?,
      philHealth: json['philHealth'] as String?,
      tinNumber: json['tin_number'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EmployeesModelImplToJson(
        _$EmployeesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middle_name': instance.middleName,
      'mobile': instance.mobile,
      'email': instance.email,
      'address': instance.address,
      'gender': instance.gender,
      'birthday': instance.birthday,
      'sss_number': instance.sssNumber,
      'pagibig_number': instance.pagibigNumber,
      'philHealth': instance.philHealth,
      'tin_number': instance.tinNumber,
      'user': instance.user,
    };
