part of 'employees_bloc.dart';

abstract class EmployeesState extends Equatable {
  const EmployeesState();

  @override
  List<Object> get props => [];
}

class EmployeesInitial extends EmployeesState {
  const EmployeesInitial();
}

class LoadingEmployeesState extends EmployeesState {
  const LoadingEmployeesState();
}

class SuccessGetEmployeesState extends EmployeesState {
  final List<EmployeesModel> listEmployeesModel;
  const SuccessGetEmployeesState(this.listEmployeesModel);
}

class ErrorGetEmployeesState extends EmployeesState {
  const ErrorGetEmployeesState();
}

class LoadingCreateEmployeesState extends EmployeesState {
  const LoadingCreateEmployeesState();
}

class SuccessCreateEmployeesState extends EmployeesState {
  const SuccessCreateEmployeesState();
}

class ErrorCreateEmployeesState extends EmployeesState {
  const ErrorCreateEmployeesState();
}
