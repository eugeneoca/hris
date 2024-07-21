part of 'employees_bloc.dart';

abstract class EmployeesEvent extends Equatable {
  const EmployeesEvent();

  @override
  List<Object> get props => [];
}

class GetEmployeesEvent extends EmployeesEvent {
  const GetEmployeesEvent();
}

class CreateEmployeesEvent extends EmployeesEvent {
  final String firstName;
  final String? middleName;
  final String? lastName;
  final String? mobile;
  final String? email;
  final String? address;
  final String? gender;
  final String? birthDate;
  final String? sssNumber;
  final String? pagibigNumber;
  final String? philhealth;
  final String? tinNumber;
  final int? roleId;
  final int? divisionId;
  final String username;
  final String password;
  const CreateEmployeesEvent(
      this.firstName,
      this.middleName,
      this.lastName,
      this.mobile,
      this.email,
      this.address,
      this.gender,
      this.birthDate,
      this.sssNumber,
      this.pagibigNumber,
      this.philhealth,
      this.tinNumber,
      this.roleId,
      this.divisionId,
      this.username,
      this.password);
}
