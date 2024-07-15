import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:remoteworkermobile/network/network_models/auth_model/auth_model.dart';
import 'package:remoteworkermobile/network/resources/constants.dart';
import 'package:remoteworkermobile/network/resources/data_state.dart';

class AuthRepository {
  // =================================================================
  //                         POST: LOGIN
  // =================================================================
  Future<DataState> login(
      {required String username, required String password}) async {
    try {
      final payload = {'username': username, 'password': password};

      Logger().e(payload);
      final request = await Dio()
          .post('${NetworkConstants.baseUrl}/auth/login/', data: payload);
      if (request.statusCode == HttpStatus.ok) {
        Logger().i(AuthModel.fromJson(request.data));
        return DataSuccess(AuthModel.fromJson(request.data));
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
