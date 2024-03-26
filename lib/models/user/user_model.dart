import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 3)
class UserModel {
  @HiveField(0)
  String ownerName;

  @HiveField(1)
  String companyName;

  @HiveField(2)
  String identificationNumber;

  @HiveField(3)
  Uint8List? logo;

  @HiveField(4)
  String? address;

  UserModel({
    required this.ownerName,
    required this.companyName,
    required this.identificationNumber,
    this.logo,
    this.address,
  });
}
