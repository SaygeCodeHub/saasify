import 'dart:convert';

FetchAllCategoriesModel fetchAllCategoriesModelFromJson(String str) =>
    FetchAllCategoriesModel.fromJson(json.decode(str));

String fetchAllCategoriesModelToJson(FetchAllCategoriesModel data) =>
    json.encode(data.toJson());

class FetchAllCategoriesModel {
  final int status;
  final List<ProductCategory> data;
  final String message;

  FetchAllCategoriesModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FetchAllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      FetchAllCategoriesModel(
        status: json["status"],
        data: List<ProductCategory>.from(
            json["data"].map((x) => ProductCategory.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class ProductCategory {
  final int categoryId;
  final String categoryName;
  final bool isActive;

  ProductCategory({
    required this.categoryId,
    required this.categoryName,
    required this.isActive,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        isActive: json["is_active"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "is_active": isActive,
      };
}
