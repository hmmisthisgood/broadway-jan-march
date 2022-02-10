import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const HasUserLoggedIn = 'has_user_logged_in';

  static setUserLoggedInStatus(bool value) async {
    final prefInstance = await SharedPreferences.getInstance();
    prefInstance.setBool(HasUserLoggedIn, value);
  }

  static Future<bool> getUserLoggedInStatus() async {
    final prefInstance = await SharedPreferences.getInstance();
    var tempValue= prefInstance.getBool(HasUserLoggedIn) ;
    bool isLoggedIn =tempValue??false;

    return isLoggedIn;
  }

  getThis() {}
}
