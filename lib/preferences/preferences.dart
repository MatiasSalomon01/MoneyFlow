import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _isDarkMode = true;
  static String _id = '';
  static String _currentUser = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', value);
  }

  static String get id {
    return _prefs.getString('id') ?? _id;
  }

  static set id(String value) {
    _id = value;
    _prefs.setString('id', value);
  }

  static String get currentUser {
    return _prefs.getString('currentUser') ?? _currentUser;
  }

  static set currentUser(String value) {
    _currentUser = value;
    _prefs.setString('currentUser', value);
  }
}
