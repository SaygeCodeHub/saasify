import 'dart:convert';

SaveProductModel saveProductModelFromJson(String str) =>
    SaveProductModel.fromJson(json.decode(str));

String saveProductModelToJson(SaveProductModel data) =>
    json.encode(data.toJson());

class SaveProductModel {
  final int status;
  final ProductData data;
  final String message;

  SaveProductModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SaveProductModel.fromJson(Map<String, dynamic> json) =>
      SaveProductModel(
        status: json["status"],
        data: ProductData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class ProductData {
  final int productId;
  final String categoryName;
  final String brandName;
  final String productName;
  final String productDescription;

  ProductData({
    required this.productId,
    required this.categoryName,
    required this.brandName,
    required this.productName,
    required this.productDescription,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        categoryName: json["category_name"] ?? '',
        brandName: json["brand_name"] ?? '',
        productName: json["product_name"] ?? '',
        productDescription: json["product_description"] ?? '',
        productId: json["product_id"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "category_name": categoryName,
        "brand_name": brandName,
        "product_name": productName,
        "product_description": productDescription,
        "product_id": productId,
      };
}
