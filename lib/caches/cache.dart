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

  void setCompanyId(int companyId) async {
    await sharedPreferences.setInt(CacheKeys.companyId, companyId);
  }

  Future<int?> getCompanyId() async {
    return sharedPreferences.getInt(CacheKeys.companyId);
  }

  void setCompanyName(String companyName) async {
    await sharedPreferences.setString(CacheKeys.companyName, companyName);
  }

  Future<String> getCompanyName() async {
    return sharedPreferences.getString(CacheKeys.companyName) ?? '';
  }

  void setBranchId(int branchId) async {
    await sharedPreferences.setInt(CacheKeys.branchId, branchId);
  }

  Future<int?> getBranchId() async {
    return sharedPreferences.getInt(CacheKeys.branchId);
  }

  void setBranchName(String branchName) async {
    await sharedPreferences.setString(CacheKeys.branchName, branchName);
  }

  Future<String> getBranchName() async {
    return sharedPreferences.getString(CacheKeys.branchName) ?? '';
  }

  void setDesignations(List<String> designations) async {
    await sharedPreferences.setStringList(CacheKeys.designations, designations);
  }

  Future<List<String>?> getDesignations() async {
    return sharedPreferences.getStringList(CacheKeys.designations);
  }

  void setAccessibleModules(List<int> accessibleModules) async {
    List<String> stringAccessibleModules =
        accessibleModules.map((int i) => i.toString()).toList();
    await sharedPreferences.setStringList(
        CacheKeys.accessibleModules, stringAccessibleModules);
  }

  Future<List<int>?> getAccessibleModules() async {
    List<String>? stringAccessibleModules =
        sharedPreferences.getStringList(CacheKeys.accessibleModules);
    List<int>? modules =
        stringAccessibleModules?.map((String s) => int.parse(s)).toList();
    return modules;
  }

  void setAccessibleFeatures(List<double> accessibleFeatures) async {
    List<String> stringAccessibleFeatures =
        accessibleFeatures.map((double d) => d.toString()).toList();
    await sharedPreferences.setStringList(
        CacheKeys.accessibleFeatures, stringAccessibleFeatures);
  }

  Future<List<double>?> getAccessibleFeatures() async {
    List<String>? stringAccessibleFeatures =
        sharedPreferences.getStringList(CacheKeys.accessibleFeatures);
    List<double>? features =
        stringAccessibleFeatures?.map((String s) => double.parse(s)).toList();

    return features;
  }

  clearSharedPreferences() async {
    sharedPreferences.clear();
  }
}
