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
  final int categoryId;
  final String categoryName;
  final String categoryIconImage;
  final List<Product> products;

  ProductsWithCategories({
    required this.categoryId,
    required this.categoryName,
    required this.categoryIconImage,
    required this.products,
  });

  factory ProductsWithCategories.fromJson(Map<String, dynamic> json) =>
      ProductsWithCategories(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryIconImage: json["category_icon/image"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_icon/image": categoryIconImage,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  final int productId;
  final String productName;
  final List<Variant> variants;

  Product({
    required this.productId,
    required this.productName,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["product_id"],
        productName: json["product_name"],
        variants: List<Variant>.from(
            json["variants"].map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
      };
}

class Variant {
  final int variantId;
  final int quantity;
  final String unit;
  final int cost;
  final String image;
  final int discount;

  Variant({
    required this.variantId,
    required this.quantity,
    required this.unit,
    required this.cost,
    required this.image,
    required this.discount,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        variantId: json["variant_id"],
        quantity: json["quantity"],
        unit: json["unit"],
        cost: json["cost"],
        image: json["image"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "variant_id": variantId,
        "quantity": quantity,
        "unit": unit,
        "cost": cost,
        "image": image,
        "discount": discount,
      };
}
