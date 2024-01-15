import 'dart:convert';

SaveCouponsModel saveCouponsModelFromJson(String str) =>
    SaveCouponsModel.fromJson(json.decode(str));

String saveCouponsModelToJson(SaveCouponsModel data) =>
    json.encode(data.toJson());

class SaveCouponsModel {
  final int status;
  final String message;
  final Data data;

  SaveCouponsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SaveCouponsModel.fromJson(Map<String, dynamic> json) =>
      SaveCouponsModel(
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
