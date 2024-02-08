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

  Future<bool> isLoggedIn() async {
    return sharedPreferences.getBool(CacheKeys.isLoggedIn) ?? false;
  }

  void setLatLong(double latitude, double longitude) async {
    await sharedPreferences.setDouble(CacheKeys.latitude, latitude);
    await sharedPreferences.setDouble(CacheKeys.longitude, longitude);
  }

  Future<List<double?>> getLatLong() async {
    double? latitude = sharedPreferences.getDouble(CacheKeys.latitude);
    double? longitude = sharedPreferences.getDouble(CacheKeys.longitude);
    return [latitude, longitude];
  }

  Future<void> saveUserLoginDetails(
      AuthenticateUserData authenticateUserData) async {
    final String serializedModel = json.encode(authenticateUserData.toJson());
    await sharedPreferences.setString(CacheKeys.userDetails, serializedModel);
  }

  void setUserId(String userId) async {
    await sharedPreferences.setString(CacheKeys.userId, userId);
  }

  Future<String> getUserId() async {
    return sharedPreferences.getString(CacheKeys.userId) ?? '';
  }

  void setUserName(String userName) async {
    await sharedPreferences.setString(CacheKeys.userName, userName);
  }

  Future<String> getUserNamed() async {
    return sharedPreferences.getString(CacheKeys.userName) ?? '';
  }

  void setCompanyId(String companyId) async {
    await sharedPreferences.setString(CacheKeys.companyId, companyId);
  }

  Future<String> getCompanyId() async {
    return sharedPreferences.getString(CacheKeys.companyId) ?? '';
  }

  void setCompanyName(String companyName) async {
    await sharedPreferences.setString(CacheKeys.companyName, companyName);
  }

  Future<String> getCompanyName() async {
    return sharedPreferences.getString(CacheKeys.companyName) ?? '';
  }

  void setBranchId(String branchId) async {
    await sharedPreferences.setString(CacheKeys.branchId, branchId);
  }

  Future<String> getBranchId() async {
    return sharedPreferences.getString(CacheKeys.companyId) ?? '';
  }
  void setBranchName(String branchName) async {
    await sharedPreferences.setString(CacheKeys.branchName, branchName);
  }

  Future<String> getBranchName() async {
    return sharedPreferences.getString(CacheKeys.branchName) ?? '';
  }

  // void setRole(List<String> roles) async {
  //   await sharedPreferences.setStringList(CacheKeys.roles, roles);
  // }
  //
  // Future<List<String>?> getRoles() async {
  //   return sharedPreferences.getStringList(CacheKeys.roles);
  // }

  clearSharedPreferences() async {
    sharedPreferences.clear();
  }
}
