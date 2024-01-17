import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'cache_keys.dart';
import '../data/models/authentication/authenticate_user_model.dart';

class Cache {
  final SharedPreferences sharedPreferences;

  Cache({required this.sharedPreferences});

  void setUserLoggedIn(bool isLoggedIn) async {
    await sharedPreferences.setBool(CacheKeys.isLoggedIn, isLoggedIn);
  }

  Future<bool?> isLoggedIn() async {
    return sharedPreferences.getBool(CacheKeys.isLoggedIn);
  }

  Future<void> saveUserLoginDetails(
      AuthenticateUserData authenticateUserData) async {
    final String serializedModel = json.encode(authenticateUserData.toJson());
    await sharedPreferences.setString(CacheKeys.userDetails, serializedModel);
  }

  static Future<AuthenticateUserData?> getModel() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? serializedModel = prefs.getString(CacheKeys.userDetails);

    if (serializedModel != null) {
      final Map<String, dynamic> jsonMap = json.decode(serializedModel);
      return AuthenticateUserData(userId: jsonMap[''], company: []);
    }

    return null;
  }
}
