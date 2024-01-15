import 'dart:convert';

EditProductModel editProductModelFromJson(String str) =>
    EditProductModel.fromJson(json.decode(str));

String editProductModelToJson(EditProductModel data) =>
    json.encode(data.toJson());

class EditProductModel {
  final int status;
  final String message;
  final Data data;

  EditProductModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EditProductModel.fromJson(Map<String, dynamic> json) =>
      EditProductModel(
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
