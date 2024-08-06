import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobilev2/main.dart';
import 'package:mobilev2/network/network_models/employees_model/employees_model.dart';
import 'package:mobilev2/network/network_repository/employees_repository.dart';

import 'package:mobilev2/network/resources/data_state.dart';
import 'package:mobilev2/src/core/call_bloc_helper.dart';
import 'package:mobilev2/src/presentation/bloc/divisions_bloc/divisions_bloc.dart';
import 'package:mobilev2/src/presentation/bloc/roles_bloc/roles_bloc.dart';
import 'package:mobilev2/src/presentation/views/widgets/custom_snackbar.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeesBloc() : super(const EmployeesInitial()) {
    on<EmployeesEvent>((event, emit) async {
      if (event is GetEmployeesEvent) {
        await _getEmployees(emit);
      }

      if (event is CreateEmployeesEvent) {
        await _createEmployees(
            emit,
            event.firstName,
            event.middleName,
            event.lastName,
            event.mobile,
            event.email,
            event.address,
            event.gender,
            event.birthDate,
            event.sssNumber,
            event.pagibigNumber,
            event.philhealth,
            event.tinNumber,
            event.roleId,
            event.divisionId,
            event.username,
            event.password);
      }
    });
  }

  Future<void> _getEmployees(
    Emitter<EmployeesState> emit,
  ) async {
    emit(const LoadingEmployeesState());

    DataState data = await EmployeesRepository().getEmployees();

    if (data is DataSuccess) {
      List<EmployeesModel> listEmployeesModel = data.data;
      emit(SuccessGetEmployeesState(listEmployeesModel));
    } else {
      emit(const ErrorGetEmployeesState());
    }
  }

  Future<void> _createEmployees(
      Emitter<EmployeesState> emit,
      String firstName,
      String? middleName,
      String? lastName,
      String? mobile,
      String? email,
      String? address,
      String? gender,
      String? birthDate,
      String? sssNumber,
      String? pagibigNumber,
      String? philhealth,
      String? tinNumber,
      int? roleId,
      int? divisionId,
      String username,
      String password) async {
    emit(const LoadingCreateEmployeesState());

    DataState data = await EmployeesRepository().createEmployees(
        firstName: firstName,
        lastName: lastName,
        middleName: middleName,
        mobile: mobile,
        email: email,
        address: address,
        gender: gender,
        birthDate: birthDate,
        sssNumber: sssNumber,
        pagibigNumber: pagibigNumber,
        philhealth: philhealth,
        tinNumber: tinNumber,
        roleId: roleId,
        divisionId: divisionId,
        username: username,
        password: password);

    if (data is DataSuccess) {
      CustomSnackbar().showSuccessSnackbar(MainApp.navigatorKey.currentContext!,
          content: "Employee Created!");

      emit(const SuccessCreateEmployeesState());
    } else {
      CustomSnackbar().showErrorSnackbar(MainApp.navigatorKey.currentContext!,
          content: "Employee Creation Failed!");
      emit(const ErrorCreateEmployeesState());
    }

    divisionsBloc.add(const GetDivisionsEvent());
    employeesBloc.add(const GetEmployeesEvent());
    rolesBloc.add(const GetRolesEvent());
  }
}
