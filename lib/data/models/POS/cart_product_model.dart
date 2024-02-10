class CartItemModel {
  final int id;
  final String name;
  final String image;
  final int cost;
  int count;
  final int quantity;

  CartItemModel({
    required this.id,
    required this.name,
    required this.image,
    required this.cost,
    required this.count,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      cost: json['cost'],
      count: json['count'],
      quantity: json['quantity'],
    );
  }
}