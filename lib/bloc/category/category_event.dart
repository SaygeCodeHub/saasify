import 'package:saasify/models/category/product_categories.dart';

abstract class CategoryEvent {}

class AddCategory extends CategoryEvent {
  final Map addCategoryMap;

  AddCategory({required this.addCategoryMap});
}

class FetchCategories extends CategoryEvent {}

class PickCategoryImage extends CategoryEvent {
  final List<ProductCategories> categories;

  PickCategoryImage({required this.categories});
}
