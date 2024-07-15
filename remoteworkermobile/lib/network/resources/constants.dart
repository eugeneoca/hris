import 'package:dio/dio.dart';
import 'package:remoteworkermobile/local_db/shared_preferences/shared_preferences.dart';
import 'package:remoteworkermobile/local_db/shared_preferences/shared_prefs_helper.dart';
import 'package:remoteworkermobile/network/resources/data_state.dart';

class NetworkConstants {
  static const baseUrl =
      "https://84a22c47750f5bf115423a86176d573d.loophole.site/api";

  Future<DataFailed> datafailed({dynamic errorMessage}) async {
    return DataFailed(DioError(
      error: errorMessage ?? "API timed out.",
      requestOptions: RequestOptions(path: ""),
    ));
  }

  Future<Map<String, dynamic>?> getHeaders() async {
    String? storedToken =
        await SharedPrefsUtil().getString(SharedPrefsHelper.token);

    if (storedToken != null && storedToken.isNotEmpty) {
      return {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $storedToken'
      };
    }
    return null;
  }
}
