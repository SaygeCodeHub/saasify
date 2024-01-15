import 'package:hive_flutter/adapters.dart';
import 'package:saasify/data/models/billing/bill_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 5)
class Customer {
  @HiveField(0)
  String customerName;
  @HiveField(1)
  String customerContact;
  @HiveField(2)
  BillModel billDetails;
  @HiveField(3)
  List<SelectedProductModel> productList;

  Customer(
      {required this.customerName,
      required this.customerContact,
      required this.billDetails,
      required this.productList});
}
