abstract class CategoriesEvents {}

class EditCategories extends CategoriesEvents {
  final Map categoryDetailsMap;

  EditCategories({required this.categoryDetailsMap});
}

class DeleteCategories extends CategoriesEvents {
  final int categoryId;

  DeleteCategories({required this.categoryId});
}

class FetchAllCategories extends CategoriesEvents {}
