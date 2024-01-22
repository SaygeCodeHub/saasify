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

  void setCompanyId(String companyId) async {
    await sharedPreferences.setString(CacheKeys.companyId, companyId);
  }

  Future<String> getCompanyId() async {
    return sharedPreferences.getString(CacheKeys.companyId) ?? '';
  }

  void setBranchId(String branchId) async {
    await sharedPreferences.setString(CacheKeys.branchId, branchId);
  }

  Future<String> getBranchId() async {
    return sharedPreferences.getString(CacheKeys.companyId) ?? '';
  }

  void setRole(List<String> roles) async {
    await sharedPreferences.setStringList(CacheKeys.roles, roles);
  }

  Future<List<String>?> getRoles() async {
    return sharedPreferences.getStringList(CacheKeys.roles);
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

  clearSharedPreferences() async {
    sharedPreferences.clear();
  }
}
