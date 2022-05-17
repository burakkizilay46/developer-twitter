import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static initalize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setisLogin(bool isLogin) {
    _prefs.setBool('isLogin', isLogin);
  }

  static bool get getIsLogin => _prefs.getBool('isLogin') ?? false;

  static void setUserId(String userId) {
    _prefs.setString('userId', userId);
  }

  static String get getUserId => _prefs.getString('userId') ?? "";
}
