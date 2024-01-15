import 'dart:convert';

FetchAllCouponsModel fetchAllCouponsModelFromJson(String str) =>
    FetchAllCouponsModel.fromJson(json.decode(str));

String fetchAllCouponsModelToJson(FetchAllCouponsModel data) =>
    json.encode(data.toJson());

class FetchAllCouponsModel {
  final int status;
  final String message;
  final Data data;

  FetchAllCouponsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FetchAllCouponsModel.fromJson(Map<String, dynamic> json) =>
      FetchAllCouponsModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
