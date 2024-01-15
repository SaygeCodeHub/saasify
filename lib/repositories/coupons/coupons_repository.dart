import '../../data/models/coupons/delete_coupons_model.dart';
import '../../data/models/coupons/edit_coupons_model.dart';
import '../../data/models/coupons/fetch_all_coupons_model.dart';
import '../../data/models/coupons/save_coupons_model.dart';

abstract class CouponsRepository {
  Future<FetchAllCouponsModel> fetchAllCoupons(String userId, String companyId);

  Future<SaveCouponsModel> saveCoupons(
      String userId, String companyId, int branchId, Map couponsDetailsMap);

  Future<EditCouponsModel> editCoupons(
      String userId, String companyId, int branchId, Map couponsDetailsMap);

  Future<DeleteCouponsModel> deleteCoupons(
      String userId, String companyId, int branchId, Map couponsIdMap);
}
