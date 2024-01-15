abstract class CustomerStates {}

class CustomerInitial extends CustomerStates {}

class CustomerFetched extends CustomerStates {
  final String name;
  final String contact;

  CustomerFetched({required this.name, required this.contact});
}
