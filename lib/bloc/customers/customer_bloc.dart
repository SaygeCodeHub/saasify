import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:saasify/utils/global.dart';

import '../../models/customer/add_customer_model.dart';
import 'customer_events.dart';
import 'customer_states.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerState get initialState => CustomerInitial();

  CustomerBloc() : super(CustomerInitial()) {
    on<AddCustomer>(_addCustomer);
  }

  FutureOr<void> _addCustomer(
      AddCustomer event, Emitter<CustomerState> emit) async {
    emit(CustomerAdding());
    try {
      if (kIsOfflineModule) {
        await _addToHive(event.customerModel);
      } else {
        await _addToFirestore(event.customerModel);
      }
      emit(CustomerAddedSuccessfully());
    } catch (e) {
      emit(CustomerAddingError('Failed to add customer. Please try again.'));
    }
  }

  Future<void> _addToHive(AddCustomerModel customerModel) async {
    final box = await Hive.openBox<AddCustomerModel>('customers');
    await box.add(customerModel);
  }

  Future<void> _addToFirestore(AddCustomerModel customerModel) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('customers').add({
      'name': customerModel.name,
      'email': customerModel.email,
      'contact': customerModel.contact,
      'dateOfBirth': customerModel.dob,
      'loyaltyPoints': customerModel.loyaltyPoints,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
