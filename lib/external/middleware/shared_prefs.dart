import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<String> getString(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static void setString(String key, String s) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(key, s);
  }

  static Future<bool> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static void setBool(String key, bool s) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, s);
  }

  static void clearShared() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
