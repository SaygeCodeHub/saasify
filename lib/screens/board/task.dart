import 'item.dart';

class Task {
  Task({
    required this.name,
    List<Item>? items,
  }) : items = items ?? [];

  final String name;
  final List<Item> items;
}
