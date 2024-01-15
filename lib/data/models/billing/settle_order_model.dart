import 'dart:convert';

SettleOrderModel settleOrderModelFromJson(String str) =>
    SettleOrderModel.fromJson(json.decode(str));

String settleOrderModelToJson(SettleOrderModel data) =>
    json.encode(data.toJson());

class SettleOrderModel {
  final int status;
  final Data data;
  final String message;

  SettleOrderModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SettleOrderModel.fromJson(Map<String, dynamic> json) =>
      SettleOrderModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
