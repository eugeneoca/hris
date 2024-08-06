import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:remoteworkermobile/network/network_models/timeinout_model/timeinout_model.dart';
import 'package:remoteworkermobile/network/resources/constants.dart';
import 'package:remoteworkermobile/network/resources/data_state.dart';

class TimeInOutRepository {
  // =================================================================
  //                         POST: CREATE
  // =================================================================
  Future<DataState> createTimeInOut({
    required int userid,
    required DateTime time,
    required DateTime date,
    required String type,
    required String geolocation,
    required XFile image,
  }) async {
    try {
      final headers = await NetworkConstants().getHeaders();

      FormData formData = FormData.fromMap({
        'userid': userid,
        'time': time.toIso8601String(),
        'date': date.toIso8601String(),
        'type': type,
        'geolocation': geolocation,
        'image': await MultipartFile.fromFile(image.path, filename: image.name),
      });

      final request = await Dio().post(
          '${NetworkConstants.baseUrl}/timeinout/create/',
          data: formData,
          options: Options(headers: headers));

      Logger().e(request);
      if (request.statusCode == HttpStatus.created) {
        return DataSuccess(TimeInOutModel.fromJson(request.data));
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
