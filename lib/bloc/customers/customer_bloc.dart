import 'package:bloc/bloc.dart';

import '../../repository/customers/customers_repo.dart';
import 'customer_events.dart';
import 'customer_states.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;

  CustomerBloc(this.customerRepository) : super(CustomerInitialState()) {
    on<AddCustomerEvent>((event, emit) async {
      emit(CustomerLoadingState());
      try {
        await customerRepository.addCustomer(event.customerModel);
        emit(CustomerAddedState());
      } catch (e) {
        emit(CustomerErrorState(e.toString()));
      }
    });
  }
}
