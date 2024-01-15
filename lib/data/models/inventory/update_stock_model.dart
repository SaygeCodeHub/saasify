import 'dart:convert';

UpdateStockModel updateStockModelFromJson(String str) =>
    UpdateStockModel.fromJson(json.decode(str));

String updateStockModelToJson(UpdateStockModel data) =>
    json.encode(data.toJson());

class UpdateStockModel {
  final int status;
  final Data data;
  final String message;

  UpdateStockModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory UpdateStockModel.fromJson(Map<String, dynamic> json) =>
      UpdateStockModel(
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
