import 'package:shared_preferences/shared_preferences.dart';
// Source of function code: https://www.youtube.com/watch?v=FTju8w4zEno&list=PLBxWkM8PLHcr2vkdY2n9rIcxjZ9Th3Us7

class Functions {
  // sp = shared preference
  static String sp_userLoggedInKey = "LOGGEDIN";
  static String sp_userNameKey = "USERNAMEKEY";
  static String sp_userEmailKey = "USEREMAILKEY";

  // saving data to SharedPreference
  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sp_userLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sp_userNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreference(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sp_userEmailKey, userEmail);
  }

  // getting data from SharedPreference
  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sp_userLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sp_userNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(sp_userEmailKey);
  }
}
