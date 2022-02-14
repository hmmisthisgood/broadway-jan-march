import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const HasUserLoggedIn = 'has_user_logged_in';

  static setUserLoggedInStatus(bool value) async {
    final prefInstance = await SharedPreferences.getInstance();
    prefInstance.setBool(HasUserLoggedIn, value);
  }

  /// This function checks if th user has logged in previously or not
  /// It returns [bool] value. i.e. `true` for logged in and `false` for logged out
  static Future<bool> getUserLoggedInStatus() async {
    final prefInstance = await SharedPreferences.getInstance();
    var tempValue = prefInstance.getBool(HasUserLoggedIn);
    bool isLoggedIn = tempValue ?? false;

    return isLoggedIn;
  }

  getThis() {}
  static logout() async {
    final prefInstance = await SharedPreferences.getInstance();

    prefInstance.clear();
  }
}
