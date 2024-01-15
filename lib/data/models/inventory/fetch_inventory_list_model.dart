import 'dart:convert';

FetchInventoryProductsModel fetchInventoryProductsModelFromJson(String str) =>
    FetchInventoryProductsModel.fromJson(json.decode(str));

String fetchInventoryProductsModelToJson(FetchInventoryProductsModel data) =>
    json.encode(data.toJson());

class FetchInventoryProductsModel {
  final int status;
  final List<InventoryProduct> data;
  final String message;

  FetchInventoryProductsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FetchInventoryProductsModel.fromJson(Map<String, dynamic> json) =>
      FetchInventoryProductsModel(
        status: json["status"],
        data: List<InventoryProduct>.from(
            json["data"].map((x) => InventoryProduct.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class InventoryProduct {
  final int categoryId;
  final String categoryName;
  final int productId;
  final String productName;
  final String brandName;
  final int brandId;
  final int variantId;
  final int cost;
  final int quantity;
  final int discountPercent;
  final int stock;
  final int stockId;
  final String productDescription;
  final List<String> images;
  final String unit;
  final int barcode;
  final bool draft;
  final String currency;
  final int sgst;
  final int cgst;
  final int restockReminder;

  InventoryProduct({
    required this.categoryId,
    required this.categoryName,
    required this.productId,
    required this.productName,
    required this.brandName,
    required this.brandId,
    required this.variantId,
    required this.cost,
    required this.quantity,
    required this.discountPercent,
    required this.stock,
    required this.stockId,
    required this.productDescription,
    required this.images,
    required this.unit,
    required this.barcode,
    required this.draft,
    required this.currency,
    required this.sgst,
    required this.cgst,
    required this.restockReminder,
  });

  factory InventoryProduct.fromJson(Map<String, dynamic> json) =>
      InventoryProduct(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        productId: json["product_id"],
        productName: json["product_name"],
        brandName: json["brand_name"],
        brandId: json["brand_id"],
        variantId: json["variant_id"],
        cost: json["cost"],
        quantity: json["quantity"],
        discountPercent: json["discount_percent"],
        stock: json["stock"],
        stockId: json["stock_id"],
        productDescription: json["product_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        unit: json["unit"],
        barcode: json["barcode"],
        draft: json["draft"],
        currency: json["currency"],
        sgst: json["SGST"],
        cgst: json["CGST"],
        restockReminder: json["restock_reminder"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "product_id": productId,
        "product_name": productName,
        "brand_name": brandName,
        "brand_id": brandId,
        "variant_id": variantId,
        "cost": cost,
        "quantity": quantity,
        "discount_percent": discountPercent,
        "stock": stock,
        "stock_id": stockId,
        "product_description": productDescription,
        "images": List<dynamic>.from(images.map((x) => x)),
        "unit": unit,
        "barcode": barcode,
        "draft": draft,
        "currency": currency,
        "SGST": sgst,
        "CGST": cgst,
        "restock_reminder": restockReminder,
      };
}
