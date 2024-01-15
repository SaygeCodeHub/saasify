import 'package:saasify/data/models/orders/fetch_orders_model.dart';

abstract class OrdersStates {}

class OrdersInitial extends OrdersStates {}

class FetchingOrders extends OrdersStates {}

class FetchedOrders extends OrdersStates {
  OrdersData fetchOrdersList;

  FetchedOrders({required this.fetchOrdersList});
}

class ErrorFetchingOrders extends OrdersStates {
  final String message;

  ErrorFetchingOrders({required this.message});
}
