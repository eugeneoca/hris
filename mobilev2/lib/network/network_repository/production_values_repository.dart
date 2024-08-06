import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mobilev2/network/network_models/production_values_model/production_values_model.dart';
import 'package:mobilev2/network/resources/constants.dart';
import 'package:mobilev2/network/resources/data_state.dart';

class ProductionValuesRepository {
  // =================================================================
  //                         GET: PRODUCTION VALUES
  // =================================================================
  Future<DataState> getProductionValues(
      {String? dateFrom, String? dateTo, int? divisionId}) async {
    try {
      final headers = await NetworkConstants().getHeaders();

      Logger().e(
          '${NetworkConstants.baseUrl}/productionvalues/all?from=$dateFrom&to=$dateTo&divisionid=$divisionId');

      final request = await Dio().get(
          '${NetworkConstants.baseUrl}/productionvalues/all?from=$dateFrom&to=$dateTo&divisionid=$divisionId',
          options: Options(headers: headers));

      if (request.statusCode == HttpStatus.ok) {
        List data = request.data;
        List<ProductionValuesModel> listProductionValues =
            data.map((e) => ProductionValuesModel.fromJson(e)).toList();
        Logger().i(listProductionValues);
        return DataSuccess(listProductionValues);
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
  //                         POST: CREATE PRODUCTION VALUES
  // =================================================================
  Future<DataState> createProductionValues(
      {required List<Map<String, dynamic>> productionValues}) async {
    try {
      final headers = await NetworkConstants().getHeaders();

      final request = await Dio().post(
          '${NetworkConstants.baseUrl}/productionvalues/create',
          data: productionValues,
          options: Options(headers: headers));

      if (request.statusCode == HttpStatus.created) {
        List data = request.data;
        List<ProductionValuesModel> listProductionValues =
            data.map((e) => ProductionValuesModel.fromJson(e)).toList();
        return DataSuccess(listProductionValues);
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
