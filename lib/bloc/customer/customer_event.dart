abstract class CustomerEvent {}

class GetCustomer extends CustomerEvent {
  final String customerContact;

  GetCustomer({required this.customerContact});
}

class EditCustomer extends CustomerEvent {}
