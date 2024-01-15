import 'dart:convert';

FetchProfileDetailsModel fetchProfileDetailsModelFromJson(String str) =>
    FetchProfileDetailsModel.fromJson(json.decode(str));

String fetchProfileDetailsModelToJson(FetchProfileDetailsModel data) =>
    json.encode(data.toJson());

class FetchProfileDetailsModel {
  final int status;
  final String message;
  final ProfileData data;

  FetchProfileDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FetchProfileDetailsModel.fromJson(Map<String, dynamic> json) =>
      FetchProfileDetailsModel(
        status: json["status"],
        message: json["message"],
        data: ProfileData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class ProfileData {
  final String storeLogo;
  final String storeName;
  final String ownerName;
  final int ownerContact;
  final String email;
  final String address;

  ProfileData({
    required this.storeLogo,
    required this.storeName,
    required this.ownerName,
    required this.ownerContact,
    required this.email,
    required this.address,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        storeLogo: json["store_logo"],
        storeName: json["store_name"],
        ownerName: json["owner_name"],
        ownerContact: json["owner_contact"],
        email: json["email"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "store_logo": storeLogo,
        "store_name": storeName,
        "owner_name": ownerName,
        "owner_contact": ownerContact,
        "email": email,
        "address": address,
      };
}
