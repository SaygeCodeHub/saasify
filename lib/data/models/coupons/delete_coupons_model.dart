import 'dart:convert';

DeleteCouponsModel deleteCouponsModelFromJson(String str) =>
    DeleteCouponsModel.fromJson(json.decode(str));

String deleteCouponsModelToJson(DeleteCouponsModel data) =>
    json.encode(data.toJson());

class DeleteCouponsModel {
  final int status;
  final String message;
  final Data data;

  DeleteCouponsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DeleteCouponsModel.fromJson(Map<String, dynamic> json) =>
      DeleteCouponsModel(
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
