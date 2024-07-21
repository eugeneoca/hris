import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mobilev2/network/network_models/auth_model/auth_model.dart';
import 'package:mobilev2/network/resources/constants.dart';
import 'package:mobilev2/network/resources/data_state.dart';

class RolesRepository {
  // =================================================================
  //                         GET: ROLES
  // =================================================================
  Future<DataState> getRoles() async {
    try {
      final headers = await NetworkConstants().getHeaders();

      final request = await Dio().get('${NetworkConstants.baseUrl}/roles/all',
          options: Options(headers: headers));

      if (request.statusCode == HttpStatus.ok) {
        List data = request.data;
        List<RolesModel> listRoles =
            data.map((e) => RolesModel.fromJson(e)).toList();
        Logger().i(listRoles);
        return DataSuccess(listRoles);
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
