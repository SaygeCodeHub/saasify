import 'package:saasify/caches/cache.dart';
import 'package:saasify/data/models/buttonAction/action_response_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/services/client_services.dart';
import 'package:saasify/utils/constants/api_constants.dart';

import 'button_action_repository.dart';

class ButtonActionRepositoryImpl implements ButtonActionRepository {
  final Cache _cache = getIt<Cache>();

  @override
  Future<ActionResponseModel> performButtonAction(
      {required String endpoint,
      required Map<String, dynamic> data,
      required String apiMethod}) async {
    final companyId = await _cache.getCompanyId();
    final branchId = await _cache.getBranchId();
    final userId = await _cache.getUserId();

    String url =
        "${ApiConstants.baseUrl3_0}$companyId/$branchId/$userId$endpoint";

    switch (apiMethod) {
      case "get":
        return ActionResponseModel.fromJson(await ClientServices().get(url));
      case "post":
        return ActionResponseModel.fromJson(
            await ClientServices().post(url, data));
      case "put":
        return ActionResponseModel.fromJson(
            await ClientServices().put(url, data));
      case "delete":
        return ActionResponseModel.fromJson(
            await ClientServices().delete(url, data));
      default:
        throw Exception("Invalid API method");
    }
  }
}
