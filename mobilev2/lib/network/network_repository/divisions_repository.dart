import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mobilev2/network/network_models/divisions_model/divisions_model.dart';
import 'package:mobilev2/network/resources/constants.dart';
import 'package:mobilev2/network/resources/data_state.dart';

class DivisionsRepository {
  // =================================================================
  //                         GET: DIVISIONS
  // =================================================================
  Future<DataState> getDivisions() async {
    try {
      final headers = await NetworkConstants().getHeaders();

      final request = await Dio().get('${NetworkConstants.baseUrl}/divisions/',
          options: Options(headers: headers));

      if (request.statusCode == HttpStatus.ok) {
        List data = request.data;
        List<DivisionsModel> listDivisions =
            data.map((e) => DivisionsModel.fromJson(e)).toList();
        Logger().i(listDivisions);
        return DataSuccess(listDivisions);
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
