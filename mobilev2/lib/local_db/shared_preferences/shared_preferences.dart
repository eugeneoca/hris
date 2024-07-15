import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtil {
  // =================================================================
  //                         STORE
  // =================================================================
  Future<void> storeString(String store, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(store, value);
  }

  Future<void> storeBool(String store, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(store, value);
  }

  // =================================================================
  //                         GET
  // =================================================================
  Future<String?> getString(String store) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(store);
  }

  Future<bool?> getBool(String store) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(store);
  }

  // =================================================================
  //                         DELETE
  // =================================================================
  Future<void> remove(String store) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(store);
  }

  Future<void> removeAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
