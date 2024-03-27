import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final customerData = {
        'name': event.customerModel.name,
        'email': event.customerModel.email,
        'contact': event.customerModel.contact,
        'dateOfBirth': event.customerModel.dob,
        'loyaltyPoints': event.customerModel.loyaltyPoints,
        'createdAt': FieldValue.serverTimestamp(),
      };
      await firestore.collection('customers').add(customerData);
      emit(CustomerAddedSuccessfully());
    } catch (e) {
      emit(CustomerAddingError('Failed to add customer. Please try again.'));
    }
  }
}
