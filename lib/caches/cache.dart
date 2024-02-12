import 'dart:convert';

import 'package:saasify/data/models/initialise/initialise_app_model.dart';
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

  void setAccessibleModules(List<ModulesModel> modulesModel) async {
    final value =
        jsonEncode(modulesModel.map((user) => user.toJson()).toList());
    sharedPreferences.setString(CacheKeys.accessibleModules, value);
  }

  Future<List<ModulesModel>> getAccessibleModules() async {
    final value = sharedPreferences.getString(CacheKeys.accessibleModules);
    if (value != null) {
      final List<dynamic> jsonArray = jsonDecode(value);
      return jsonArray.map((json) => ModulesModel.fromJson(json)).toList();
    }
    return [];
  }

  void setAvailableModules(List<ModulesModel> modulesModel) async {
    final value =
        jsonEncode(modulesModel.map((user) => user.toJson()).toList());
    sharedPreferences.setString(CacheKeys.availableModules, value);
  }

  Future<List<ModulesModel>> getAvailableModules() async {
    final value = sharedPreferences.getString(CacheKeys.availableModules);
    if (value != null) {
      final List<dynamic> jsonArray = jsonDecode(value);
      return jsonArray.map((json) => ModulesModel.fromJson(json)).toList();
    }
    return [];
  }

  void setAccessibleFeatures(List<FeatureDetailModel> modulesModel) async {
    final value =
        jsonEncode(modulesModel.map((user) => user.toJson()).toList());
    sharedPreferences.setString(CacheKeys.accessibleFeatures, value);
  }

  Future<List<FeatureDetailModel>> getAccessibleFeatures() async {
    final value = sharedPreferences.getString(CacheKeys.accessibleFeatures);
    if (value != null) {
      final List<dynamic> jsonArray = jsonDecode(value);
      return jsonArray
          .map((json) => FeatureDetailModel.fromJson(json))
          .toList();
    }
    return [];
  }

  Future<bool> setFCMToken(String stringValue) async {
    return sharedPreferences.setString(CacheKeys.fcmToken, stringValue);
  }

  Future<String?> getFCMToken(String key) async {
    return sharedPreferences.getString(CacheKeys.fcmToken);
  }

  clearSharedPreferences() async {
    sharedPreferences.clear();
  }
}
