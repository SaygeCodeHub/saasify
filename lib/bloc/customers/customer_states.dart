abstract class CustomerState {}

class CustomerInitialState extends CustomerState {}

class CustomerLoadingState extends CustomerState {}

class CustomerAddedState extends CustomerState {}

class CustomerErrorState extends CustomerState {
  final String message;

  CustomerErrorState(this.message);
}
