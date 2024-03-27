import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/customer/add_customer_model.dart';
import 'customers_repo.dart';

class CustomerRepositoryImplementation implements CustomerRepository {
  @override
  Future<void> addCustomer(AddCustomerModel customerModel) async {
    final customersRef = FirebaseFirestore.instance.collection('customers');
    await customersRef.add({
      'name': customerModel.name,
      'email': customerModel.email,
      'contact': customerModel.contact,
      'dateOfBirth': customerModel.dob,
      'loyaltyPoints': customerModel.loyaltyPoints,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
