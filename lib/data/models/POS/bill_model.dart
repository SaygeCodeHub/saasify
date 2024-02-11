class BillModel {
  String orderNumber;
  String orderDate;
  String customerName;
  String customerPhone;
  double totalAmount;
  double discount;
  double itemTotal;
  double tax;

  BillModel({
    required this.orderNumber,
    required this.orderDate,
    required this.customerName,
    required this.customerPhone,
    required this.totalAmount,
    required this.discount,
    required this.itemTotal,
    required this.tax,
  });

  factory BillModel.fromJson(Map<String, dynamic> json) {
    return BillModel(
      orderNumber: json['orderNumber'],
      orderDate: json['orderDate'],
      customerName: json['customerName'],
      customerPhone: json['customerPhone'],
      totalAmount: json['totalAmount'],
      discount: json['discount'],
      itemTotal: json['itemTotal'],
      tax: json['tax'],
    );
  }
}
