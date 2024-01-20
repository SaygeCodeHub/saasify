import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/generalModels/user_selections.dart';
import 'cache_keys.dart';
import '../data/models/authentication/authenticate_user_model.dart';

class Cache {
  final SharedPreferences sharedPreferences;

  Cache({required this.sharedPreferences});

  void setUserLoggedIn(bool isLoggedIn) async {
    await sharedPreferences.setBool(CacheKeys.isLoggedIn, isLoggedIn);
  }

  Future<bool> isLoggedIn() async {
    return sharedPreferences.getBool(CacheKeys.isLoggedIn) ?? false;
  }

  Future<void> saveUserLoginDetails(
      AuthenticateUserData authenticateUserData) async {
    final String serializedModel = json.encode(authenticateUserData.toJson());
    await sharedPreferences.setString(CacheKeys.userDetails, serializedModel);
  }

  Future<AuthenticateUserData?> getUserLoginDetails() async {
    String? serializedModel =
        sharedPreferences.getString(CacheKeys.userDetails);

    if (serializedModel != null) {
      Map<String, dynamic> jsonMap = json.decode(serializedModel);
      AuthenticateUserData userData = AuthenticateUserData.fromJson(jsonMap);
      return userData;
    } else {
      return null;
    }
  }

  Future<void> saveUserSelections(UserSelections userSelections) async {
    final String serializedModel = json.encode(userSelections.toJson());
    await sharedPreferences.setString(CacheKeys.userDetails, serializedModel);
  }

  Future<UserSelections?> getUserSelections() async {
    String? serializedModel =
        sharedPreferences.getString(CacheKeys.userDetails);

    if (serializedModel != null) {
      Map<String, dynamic> jsonMap = json.decode(serializedModel);
      UserSelections userSelections = UserSelections.fromJson(jsonMap);
      return userSelections;
    } else {
      return null;
    }
  }

  clearSharedPreferences() async {
    sharedPreferences.clear();
  }
}
