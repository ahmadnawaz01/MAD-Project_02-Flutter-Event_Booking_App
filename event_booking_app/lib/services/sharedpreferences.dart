

import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferenceHelper {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userImageKey = "USERIMAGEKEY";
  static String flag="flag";

  
  static String bookingDetailsKey = "BOOKINGDETAILSKEY";

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userImageKey, getUserImage);
  }
  Future<bool> saveflag(bool f) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(flag, f);
  }
  Future<bool?> getflag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(flag);
  }


  Future<String?> getUserName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(userNameKey);
}

Future<String?> getUserImage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(userImageKey);
}

Future<String?> getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(userIdKey);
}
Future<String?> getUserEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(userEmailKey);
}
}