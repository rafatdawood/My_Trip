import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  loggedIn,
  uid,
}

class PreferenceUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString(PrefKeys key, [String defValue = '']) {
    return _prefsInstance?.getString(key.name) ?? defValue;
  }

  static Future<bool> setString(PrefKeys key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key.name, value);
  }

  static bool getBool(PrefKeys key, [bool defValue = false]) {
    return _prefsInstance?.getBool(key.name) ?? defValue;
  }

  static Future<bool> setBool(PrefKeys key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key.name, value);
  }

  static int getInt(PrefKeys key, [int defValue = 0]) {
    return _prefsInstance?.getInt(key.name) ?? defValue;
  }

  static Future<bool> setInt(PrefKeys key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key.name, value);
  }

}
