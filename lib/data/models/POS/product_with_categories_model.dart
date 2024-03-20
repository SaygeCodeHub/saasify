import 'dart:convert';

ProductsWithCategoriesModel getAllProductsWithCategoriesFromJson(String str) =>
    ProductsWithCategoriesModel.fromJson(json.decode(str));

String getAllProductsWithCategoriesToJson(ProductsWithCategoriesModel data) =>
    json.encode(data.toJson());

class ProductsWithCategoriesModel {
  final int status;
  final String message;
  final List<ProductsWithCategories> data;

  ProductsWithCategoriesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductsWithCategoriesModel.fromJson(Map<String, dynamic> json) =>
      ProductsWithCategoriesModel(
        status: json["status"],
        message: json["message"],
        data: List<ProductsWithCategories>.from(
            json["data"].map((x) => ProductsWithCategories.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductsWithCategories {
  final String categoryName;
  final String description;
  final int categoryId;

  final List<Product> products;

  ProductsWithCategories(
      {required this.categoryName,
      required this.description,
      required this.categoryId,
      required this.products});

  factory ProductsWithCategories.fromJson(Map<String, dynamic> json) =>
      ProductsWithCategories(
        categoryName: json["name"],
        description: json["description"] ?? '',
        categoryId: json["category_id"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": categoryName,
        "description": description,
        "category_id": categoryId,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int productId;
  final String productName;
  final String description;
  final List<Variant> variants;

  Product({
    required this.productId,
    required this.productName,
    required this.description,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productName: json["product_name"] ?? '',
        description: json["description"] ?? '',
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "description": description,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
      };
}

class Variant {
  final int variantId;
  final String variantName;
  final String quantity;
  final String unit;
  final double cost;

  Variant(
      {required this.variantId,
      required this.variantName,
      required this.quantity,
      required this.unit,
      required this.cost});

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantId: json["variant_id"],
        variantName: json["variant_name"],
        quantity: json["measuring_qty"],
        unit: json["unit"],
        cost: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "variant_id": variantId,
        "variant_name": variantName,
        "measuring_qty": quantity,
        "unit": unit,
        "price": cost
      };
}
