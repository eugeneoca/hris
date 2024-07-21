import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mobilev2/network/network_models/employees_model/employees_model.dart';
import 'package:mobilev2/network/resources/constants.dart';
import 'package:mobilev2/network/resources/data_state.dart';

class EmployeesRepository {
  // =================================================================
  //                         GET: ALL EMPLOYEES
  // =================================================================
  Future<DataState> getEmployees() async {
    try {
      final headers = await NetworkConstants().getHeaders();

      final request = await Dio().get(
          '${NetworkConstants.baseUrl}/employees/all',
          options: Options(headers: headers));

      if (request.statusCode == HttpStatus.ok) {
        List data = request.data;
        List<EmployeesModel> listEmployees =
            data.map((e) => EmployeesModel.fromJson(e)).toList();
        Logger().i(listEmployees);
        return DataSuccess(listEmployees);
      } else {
        return NetworkConstants().datafailed();
      }
    } on DioError catch (e) {
      Logger().e("${e.message}\n${e.response}");
      return NetworkConstants().datafailed(errorMessage: e.response);
    } catch (e) {
      Logger().e(e);
      return NetworkConstants().datafailed();
    }
  }

  // =================================================================
  //                         POST: CREATE EMPLOYEE
  // =================================================================
  Future<DataState> createEmployees(
      {required String firstName,
      String? middleName,
      required String? lastName,
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
      required String username,
      required String password}) async {
    try {
      final headers = await NetworkConstants().getHeaders();

      final payload = {
        "username": username,
        "password": password,
        "roleId": roleId,
        "divisionId": divisionId,
        "firstName": firstName,
        "lastName": lastName,
        "middleName": middleName,
        "mobile": mobile,
        "email": email,
        "address": address,
        "gender": gender,
        "birthday": birthDate,
        "sssNumber": sssNumber,
        "pagibigNumber": pagibigNumber,
        "philhealth": philhealth,
        "tinNumber": tinNumber
      };

      final request = await Dio().post(
          '${NetworkConstants.baseUrl}/employees/create',
          data: payload,
          options: Options(headers: headers));

      if (request.statusCode == HttpStatus.created) {
        return const DataSuccess(null);
      } else {
        return NetworkConstants().datafailed();
      }
    } on DioError catch (e) {
      Logger().e("${e.message}\n${e.response}");
      return NetworkConstants().datafailed(errorMessage: e.response);
    } catch (e) {
      Logger().e(e);
      return NetworkConstants().datafailed();
    }
  }
}
