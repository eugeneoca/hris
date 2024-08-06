import 'package:dio/dio.dart';
import 'package:mobilev2/local_db/shared_preferences/shared_preferences.dart';
import 'package:mobilev2/local_db/shared_preferences/shared_prefs_helper.dart';
import 'package:mobilev2/network/resources/data_state.dart';

class NetworkConstants {
  static const baseUrl =
      "https://27f37bc4f8b3357e1fe06efd1ba68291.loophole.site/api";

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
