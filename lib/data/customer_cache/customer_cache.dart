import 'package:shared_preferences/shared_preferences.dart';

import 'cache_keys.dart';

class CustomerCache {
  final SharedPreferences sharedPreferences;

  CustomerCache({required this.sharedPreferences});

  void setIsLoggedIn(bool isLoggedIn) async {
    await sharedPreferences.setBool(CacheKeys.isLoggedIn, isLoggedIn);
  }

  void setUserId(String userId) async {
    await sharedPreferences.setString(CacheKeys.userId, userId);
  }

  void setCompanyId(String companyId) async {
    await sharedPreferences.setString(CacheKeys.companyId, companyId);
  }

  void setBranchId(int branchId) async {
    await sharedPreferences.setInt(CacheKeys.branchId, branchId);
  }

  void setUserName(String userName) async {
    await sharedPreferences.setString(CacheKeys.userName, userName);
  }

  void setUserContact(int userContact) async {
    await sharedPreferences.setInt(CacheKeys.userContact, userContact);
  }

  Future<bool?> getIsLoggedIn() async {
    return sharedPreferences.getBool(CacheKeys.isLoggedIn);
  }

  Future<String> getUserId() async {
    return sharedPreferences.getString(CacheKeys.userId) ?? '';
  }

  Future<int> getBranchId() async {
    return sharedPreferences.getInt(CacheKeys.branchId) ?? -1;
  }

  Future<String> getCompanyId() async {
    return sharedPreferences.getString(CacheKeys.companyId) ?? '';
  }

  Future<String> getUserName() async {
    return sharedPreferences.getString(CacheKeys.userName) ?? '';
  }

  Future<int> getUserContact() async {
    return sharedPreferences.getInt(CacheKeys.userContact) ?? 0;
  }

  Future<bool> clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    return true;
  }
}
