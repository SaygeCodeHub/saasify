import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/utils/dashboard_card.dart';
import '../../data/customer_cache/customer_cache.dart';
import '../../di/app_module.dart';
import '../../repositories/orders/orders_repository.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  final OrdersRepository _ordersRepository = getIt<OrdersRepository>();
  final CustomerCache _customerCache = getIt<CustomerCache>();

  OrdersStates get initialState => OrdersInitial();

  OrdersBloc() : super(OrdersInitial()) {
    on<FetchOrdersList>(_fetchOrdersList);
    on<SelectOrder>(_selectOrder);
  }

  FutureOr<void> _fetchOrdersList(
      FetchOrdersList event, Emitter<OrdersStates> emit) async {
    emit(FetchingOrders());
    //try {
    String userId = await _customerCache.getUserId();
    String companyId = await _customerCache.getCompanyId();
    int branchId = await _customerCache.getBranchId();

    FetchOrdersModel fetchOrdersModel =
        await _ordersRepository.fetchOrdersList(userId, companyId, branchId);

    dashboardCard[0].subtitle = fetchOrdersModel.data.totalOrders.toString();
    dashboardCard[1].subtitle =
        fetchOrdersModel.data.unpaidOrder.count.toString();
    dashboardCard[2].subtitle = (fetchOrdersModel.data.totalOrders -
            fetchOrdersModel.data.unpaidOrder.count)
        .toString();
    dashboardCard[3].subtitle = '₹ ${fetchOrdersModel.data.totalEarning}';
    if (fetchOrdersModel.status == 200) {
      emit(FetchedOrders(fetchOrdersList: fetchOrdersModel.data));
    } else {
      emit(ErrorFetchingOrders(message: fetchOrdersModel.message));
    }
  }

  _selectOrder(SelectOrder event, Emitter<OrdersStates> emit) {
    emit(FetchedOrders(fetchOrdersList: event.orders));
  }
}
