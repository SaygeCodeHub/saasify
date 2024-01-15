import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/customer/customer_event.dart';
import 'package:saasify/bloc/customer/customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerStates> {
  CustomerBloc() : super(CustomerInitial()) {
    on<GetCustomer>(_getCustomer);
  }

  FutureOr<void> _getCustomer(GetCustomer event, Emitter<CustomerStates> emit) {
    if (event.customerContact == '') {
      emit(CustomerInitial());
    } else {
      emit(CustomerFetched(name: 'Customer', contact: event.customerContact));
    }
  }
}
