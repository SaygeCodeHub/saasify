import 'package:saasify/data/models/categories/fetch_all_categories_model.dart';

abstract class CategoriesStates {}

class CategoriesInitial extends CategoriesStates {}

class EditingCategories extends CategoriesStates {}

class EditedCategories extends CategoriesStates {
  final String message;

  EditedCategories({required this.message});
}

class ErrorEditingCategories extends CategoriesStates {
  final String message;

  ErrorEditingCategories({required this.message});
}

class DeletingCategories extends CategoriesStates {}

class DeletedCategories extends CategoriesStates {
  final String message;

  DeletedCategories({required this.message});
}

class ErrorDeletingCategories extends CategoriesStates {
  final String message;

  ErrorDeletingCategories({required this.message});
}

class FetchingCategories extends CategoriesStates {}

class FetchedCategories extends CategoriesStates {
  final List<ProductCategory> categoryList;

  FetchedCategories({required this.categoryList});
}

class ErrorFetchingCategories extends CategoriesStates {
  final String message;

  ErrorFetchingCategories({required this.message});
}

class SwitchToggleCategories extends CategoriesStates {
  final bool categoryToggle;

  SwitchToggleCategories({required this.categoryToggle});
}
