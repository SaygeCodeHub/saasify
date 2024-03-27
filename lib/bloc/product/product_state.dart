abstract class ProductState {}

final class ProductInitial extends ProductState {}

final class AddingProduct extends ProductState {}

final class ProductAdded extends ProductState {
  final String successMessage;

  ProductAdded({required this.successMessage});
}

final class ProductNotAdded extends ProductState {
  final String errorMessage;

  ProductNotAdded({required this.errorMessage});
}
