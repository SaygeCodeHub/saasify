import 'package:hive/hive.dart';

import '../models/cart_model.dart';

class CartItemAdapter extends TypeAdapter<Cart> {
  @override
  final int typeId = 3;

  @override
  Cart read(BinaryReader reader) {
    final fields = reader.readByte();
    final Map<dynamic, dynamic> data = {};
    for (var i = 0; i < fields; i++) {
      final key = reader.readString();
      final value = reader.read();
      data[key] = value;
    }
    return Cart(
      name: data['name'],
      cost: data['cost'],
      quantity: data['quantity'],
      count: data['count'],
      variantCost: data['variantCost'],
    );
  }

  @override
  void write(BinaryWriter writer, Cart obj) {
    writer.writeByte(5);
    writer.writeString('name');
    writer.write(obj.name);
    writer.writeString('cost');
    writer.write(obj.cost);
    writer.writeString('quantity');
    writer.write(obj.quantity);
    writer.writeString('count');
    writer.write(obj.count);
    writer.writeString('variantCost');
    writer.write(obj.variantCost);
  }
}
