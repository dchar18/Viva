import 'package:shared_preferences/shared_preferences.dart';
// Source of function code: https://www.youtube.com/watch?v=FTju8w4zEno&list=PLBxWkM8PLHcr2vkdY2n9rIcxjZ9Th3Us7

class Functions {
  static String UserLoggedInKey = "LOGGEDIN";
  static String UserNameKey = "USERNAMEKEY";
  static String UserEmailKey = "USEREMAILKEY";

  // saving data to SharedPreference
  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(UserLoggedInKey, isUserLoggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(UserNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreference(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(UserEmailKey, userEmail);
  }

  // getting data from SharedPreference
  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(UserLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UserNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(UserEmailKey);
  }
}
