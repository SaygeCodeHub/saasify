import '../../models/customer/add_customer_model.dart';

abstract class CustomerEvent {}

class AddCustomerEvent extends CustomerEvent {
  final AddCustomerModel customerModel;

  AddCustomerEvent(this.customerModel);
}
