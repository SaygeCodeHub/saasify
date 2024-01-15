import '../../data/models/orders/fetch_orders_model.dart';
import '../../services/client_services.dart';
import '../../utils/constants/api_constants.dart';
import 'orders_repository.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  @override
  Future<FetchOrdersModel> fetchOrdersList(
      String userId, companyId, branchId) async {
    final response = await ClientServices().get(
        '${ApiConstants.baseUrl}$userId/$companyId/$branchId/getAllOrders');
    return FetchOrdersModel.fromJson(response);
  }
}
