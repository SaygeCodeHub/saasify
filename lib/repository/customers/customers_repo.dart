import '../../models/customer/add_customer_model.dart';

abstract class CustomerRepository {
  Future<void> addCustomer(AddCustomerModel customerModel);
}
