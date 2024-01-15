import '../../data/models/coupons/delete_coupons_model.dart';
import '../../data/models/coupons/edit_coupons_model.dart';
import '../../data/models/coupons/fetch_all_coupons_model.dart';
import '../../data/models/coupons/save_coupons_model.dart';
import '../../services/client_services.dart';
import '../../utils/constants/api_constants.dart';
import 'coupons_repository.dart';

class CouponsRepositoryImpl implements CouponsRepository {
  @override
  Future<FetchAllCouponsModel> fetchAllCoupons(
      String userId, String companyId) async {
    final response = await ClientServices()
        .get('${ApiConstants.baseUrl}$userId/$companyId/getAllBranches');
    return FetchAllCouponsModel.fromJson(response);
  }

  @override
  Future<SaveCouponsModel> saveCoupons(String userId, String companyId,
      int branchId, Map productDetailsMap) async {
    final response = await ClientServices().post(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/addProduct',
        productDetailsMap);
    return SaveCouponsModel.fromJson(response);
  }

  @override
  Future<EditCouponsModel> editCoupons(String userId, String companyId,
      int branchId, Map productDetailsMap) async {
    final response = await ClientServices().put(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/editProduct',
        productDetailsMap);
    return EditCouponsModel.fromJson(response);
  }

  @override
  Future<DeleteCouponsModel> deleteCoupons(
      String userId, String companyId, int branchId, Map couponIdMap) async {
    final response = await ClientServices().delete(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/deleteVariant',
        couponIdMap);
    return DeleteCouponsModel.fromJson(response);
  }
}
