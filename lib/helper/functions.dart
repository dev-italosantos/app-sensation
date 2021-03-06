import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctioncs {
  static String   userLoggedInKey = "USERLOGGEDINKEY";

  static saveUserLoggedInDetalis({required bool isLoggedin}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(userLoggedInKey, isLoggedin);
  }
  static Future<bool> getUserLoggedInDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(userLoggedInKey) ?? false;
  }
}