import 'dart:convert';

FetchOrdersModel fetchOrdersModelFromJson(String str) =>
    FetchOrdersModel.fromJson(json.decode(str));

String fetchOrdersModelToJson(FetchOrdersModel data) =>
    json.encode(data.toJson());

class FetchOrdersModel {
  final int status;
  final OrdersData data;
  final String message;

  FetchOrdersModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory FetchOrdersModel.fromJson(Map<String, dynamic> json) =>
      FetchOrdersModel(
        status: json["status"],
        data: OrdersData.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class OrdersData {
  final double totalEarning;
  final int totalOrders;
  final UnpaidOrder unpaidOrder;
  final PaymentMethods paymentMethods;
  final List<Order> orders;

  OrdersData({
    required this.totalEarning,
    required this.totalOrders,
    required this.unpaidOrder,
    required this.paymentMethods,
    required this.orders,
  });

  factory OrdersData.fromJson(Map<String, dynamic> json) => OrdersData(
        totalEarning: json["total_earning"],
        totalOrders: json["total_orders"],
        unpaidOrder: UnpaidOrder.fromJson(json["unpaid_order"]),
        paymentMethods: PaymentMethods.fromJson(json["payment_methods"]),
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_earning": totalEarning,
        "total_orders": totalOrders,
        "unpaid_order": unpaidOrder.toJson(),
        "payment_methods": paymentMethods.toJson(),
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  final int orderId;
  final String orderNumber;
  final DateTime orderDate;
  final int customerContact;
  final String paymentStatus;
  final String paymentType;
  final String customerName;
  final double discountTotal;
  final double totalAmount;
  final double subtotal;
  final List<ItemsOrdered> itemsOrdered;
  final String currency;

  Order({
    required this.orderId,
    required this.orderNumber,
    required this.orderDate,
    required this.customerContact,
    required this.paymentStatus,
    required this.paymentType,
    required this.customerName,
    required this.discountTotal,
    required this.totalAmount,
    required this.subtotal,
    required this.itemsOrdered,
    required this.currency,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        orderId: json["order_id"],
        orderNumber: json["order_number"],
        orderDate: DateTime.parse(json["order_date"]),
        customerContact: json["customer_contact"],
        paymentStatus: json["payment_status"],
        paymentType: json["payment_type"],
        customerName: json["customer_name"],
        discountTotal: json["discount_total"].toDouble(),
        totalAmount: json["total_amount"].toDouble(),
        subtotal: json["subtotal"],
        itemsOrdered: List<ItemsOrdered>.from(
            json["items_ordered"].map((x) => ItemsOrdered.fromJson(x))),
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_number": orderNumber,
        "order_date": orderDate.toIso8601String(),
        "customer_contact": customerContact,
        "payment_status": paymentStatus,
        "payment_type": paymentType,
        "customer_name": customerName,
        "discount_total": discountTotal,
        "total_amount": totalAmount,
        "subtotal": subtotal,
        "items_ordered":
            List<dynamic>.from(itemsOrdered.map((x) => x.toJson())),
        "currency": currency,
      };
}

class ItemsOrdered {
  final int categoryId;
  final String categoryName;
  final String productName;
  final String brandName;
  final int brandId;
  final int variantId;
  final double cost;
  final int quantity;
  final int stock;
  final int stockId;
  final double discountPercent;
  final String productDescription;
  final List<String> images;
  final String unit;
  final int barcode;
  final bool draft;
  final int restockReminder;
  final int count;

  ItemsOrdered({
    required this.categoryId,
    required this.categoryName,
    required this.productName,
    required this.brandName,
    required this.brandId,
    required this.variantId,
    required this.cost,
    required this.quantity,
    required this.stock,
    required this.stockId,
    required this.discountPercent,
    required this.productDescription,
    required this.images,
    required this.unit,
    required this.barcode,
    required this.draft,
    required this.restockReminder,
    required this.count,
  });

  factory ItemsOrdered.fromJson(Map<String, dynamic> json) => ItemsOrdered(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        productName: json["product_name"],
        brandName: json["brand_name"],
        brandId: json["brand_id"],
        variantId: json["variant_id"],
        cost: json["cost"],
        quantity: json["quantity"],
        stock: json["stock"],
        stockId: json["stock_id"],
        discountPercent: json["discount_percent"],
        productDescription: json["product_description"],
        images: List<String>.from(json["images"].map((x) => x)),
        unit: json["unit"],
        barcode: json["barcode"],
        draft: json["draft"],
        restockReminder: json["restock_reminder"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "product_name": productName,
        "brand_name": brandName,
        "brand_id": brandId,
        "variant_id": variantId,
        "cost": cost,
        "quantity": quantity,
        "stock": stock,
        "stock_id": stockId,
        "discount_percent": discountPercent,
        "product_description": productDescription,
        "images": List<dynamic>.from(images.map((x) => x)),
        "unit": unit,
        "barcode": barcode,
        "draft": draft,
        "restock_reminder": restockReminder,
        "count": count,
      };
}

class PaymentMethods {
  final UnpaidOrder other;
  final UnpaidOrder upi;
  final UnpaidOrder bankCard;
  final UnpaidOrder cash;

  PaymentMethods({
    required this.other,
    required this.upi,
    required this.bankCard,
    required this.cash,
  });

  factory PaymentMethods.fromJson(Map<String, dynamic> json) => PaymentMethods(
        other: UnpaidOrder.fromJson(json["Other"]),
        upi: UnpaidOrder.fromJson(json["UPI"]),
        bankCard: UnpaidOrder.fromJson(json["Bank Card"]),
        cash: UnpaidOrder.fromJson(json["cash"]),
      );

  Map<String, dynamic> toJson() => {
        "Other": other.toJson(),
        "UPI": upi.toJson(),
        "Bank Card": bankCard.toJson(),
        "cash": cash.toJson(),
      };
}

class UnpaidOrder {
  final int count;
  final double percent;

  UnpaidOrder({
    required this.count,
    required this.percent,
  });

  factory UnpaidOrder.fromJson(Map<String, dynamic> json) => UnpaidOrder(
        count: json["count"],
        percent: json["percent"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "percent": percent,
      };
}
