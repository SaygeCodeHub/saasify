import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'fetch_products_by_category_model.g.dart';

FetchProductsByCategoryModel fetchProductsByCategoryModelFromJson(String str) =>
    FetchProductsByCategoryModel.fromJson(json.decode(str));

String fetchProductsByCategoryModelToJson(FetchProductsByCategoryModel data) =>
    json.encode(data.toJson());

class FetchProductsByCategoryModel {
  final int status;
  final List<CategoryWithProductsDatum> data;
  final String message;

  FetchProductsByCategoryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FetchProductsByCategoryModel.fromJson(Map<String, dynamic> json) =>
      FetchProductsByCategoryModel(
        status: json["status"],
        data: List<CategoryWithProductsDatum>.from(
            json["data"].map((x) => CategoryWithProductsDatum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

@HiveType(typeId: 4)
class CategoryWithProductsDatum {
  @HiveField(0)
  final int categoryId;
  @HiveField(1)
  final String categoryName;
  @HiveField(2)
  final List<Product> products;

  CategoryWithProductsDatum({
    required this.categoryId,
    required this.categoryName,
    required this.products,
  });

  factory CategoryWithProductsDatum.fromJson(Map<String, dynamic> json) =>
      CategoryWithProductsDatum(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final int productId;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final int brandId;
  @HiveField(3)
  final String brandName;
  @HiveField(4)
  final String productDescription;
  @HiveField(5)
  final List<Variant> variants;

  Product({
    required this.productId,
    required this.productName,
    required this.brandId,
    required this.brandName,
    required this.productDescription,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productName: json["product_name"],
        brandId: json["brand_id"],
        brandName: json["brand_name"],
        productDescription: json["product_description"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "brand_id": brandId,
        "brand_name": brandName,
        "product_description": productDescription,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 2)
class Variant {
  @HiveField(0)
  final int variantId;
  @HiveField(1)
  final int cost;
  @HiveField(2)
  final int quantity;
  @HiveField(3)
  final int discountPercent;
  @HiveField(4)
  final int stockId;
  @HiveField(5)
  final int stock;
  @HiveField(6)
  final List<String> images;
  @HiveField(7)
  final String unit;
  @HiveField(8)
  final int barcode;
  @HiveField(9)
  final int restockReminder;
  @HiveField(10)
  final bool draft;
  @HiveField(11)
  final String currency;

  Variant({
    required this.currency,
    required this.variantId,
    required this.cost,
    required this.quantity,
    required this.discountPercent,
    required this.stockId,
    required this.stock,
    required this.images,
    required this.unit,
    required this.barcode,
    required this.restockReminder,
    required this.draft,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantId: json["variant_id"],
        cost: json["cost"],
        quantity: json["quantity"],
        discountPercent: json["discount_percent"],
        stockId: json["stock_id"],
        stock: json["stock"],
        images: List<String>.from(json["images"].map((x) => x)),
        unit: json["unit"],
        barcode: json["barcode"],
        restockReminder: json["restock_reminder"],
        draft: json["draft"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "variant_id": variantId,
        "cost": cost,
        "quantity": quantity,
        "discount_percent": discountPercent,
        "stock_id": stockId,
        "stock": stock,
        "images": List<dynamic>.from(images.map((x) => x)),
        "unit": unit,
        "barcode": barcode,
        "restock_reminder": restockReminder,
        "draft": draft,
        "currency": currency
      };
}
