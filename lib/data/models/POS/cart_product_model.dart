class CartItemModel {
  final int id;
  final String name;
  final String image;
  final String unit;
  double cost;
  int count;
  final double quantity;
  double variantCost;

  CartItemModel(
      {required this.id,
      required this.unit,
      required this.name,
      required this.image,
      required this.cost,
      required this.count,
      required this.quantity,
      this.variantCost = 0});

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      unit: json['unit'],
      name: json['name'],
      image: json['image'],
      cost: json['cost'],
      count: json['count'],
      quantity: json['quantity'],
    );
  }
}
