import 'dart:convert';

EditCategoriesModel editCategoriesModelFromJson(String str) =>
    EditCategoriesModel.fromJson(json.decode(str));

String editCategoriesModelToJson(EditCategoriesModel data) =>
    json.encode(data.toJson());

class EditCategoriesModel {
  final int status;
  final Data data;
  final String message;

  EditCategoriesModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory EditCategoriesModel.fromJson(Map<String, dynamic> json) =>
      EditCategoriesModel(
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
