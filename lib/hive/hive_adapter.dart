import 'package:hive/hive.dart';

// part 'category.g.dart'; // Generated file

@HiveType(typeId: 0)
class Category extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String description;
}
