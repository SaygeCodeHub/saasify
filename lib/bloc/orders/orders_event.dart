import 'package:saasify/data/models/orders/fetch_orders_model.dart';

abstract class OrdersEvents {}

class FetchOrdersList extends OrdersEvents {}

class SelectOrder extends OrdersEvents {
  OrdersData orders;

  SelectOrder({required this.orders});
}
