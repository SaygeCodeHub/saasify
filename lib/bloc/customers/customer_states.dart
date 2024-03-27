abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class CustomerAdding extends CustomerState {}

class CustomerAddedSuccessfully extends CustomerState {}

class CustomerAddingError extends CustomerState {
  final String message;

  CustomerAddingError(this.message);
}
