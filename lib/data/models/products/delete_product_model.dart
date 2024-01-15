import 'dart:convert';

DeleteProductsModel deleteProductsModelFromJson(String str) =>
    DeleteProductsModel.fromJson(json.decode(str));

String deleteProductsModelToJson(DeleteProductsModel data) =>
    json.encode(data.toJson());

class DeleteProductsModel {
  final int status;
  final Data data;
  final String message;

  DeleteProductsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DeleteProductsModel.fromJson(Map<String, dynamic> json) =>
      DeleteProductsModel(
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
