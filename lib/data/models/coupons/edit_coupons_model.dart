import 'dart:convert';

EditCouponsModel editCouponsModelFromJson(String str) =>
    EditCouponsModel.fromJson(json.decode(str));

String editCouponsModelToJson(EditCouponsModel data) =>
    json.encode(data.toJson());

class EditCouponsModel {
  final int status;
  final String message;
  final Data data;

  EditCouponsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EditCouponsModel.fromJson(Map<String, dynamic> json) =>
      EditCouponsModel(
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
