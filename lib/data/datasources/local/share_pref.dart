// luu gia tri don gian
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  SharePref._internal();

  static final SharePref _instance = SharePref._internal();

  static SharePref get instance {
    return _instance;
  }

  Future set(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  dynamic get(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(key);
  }

  void clearSharePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
