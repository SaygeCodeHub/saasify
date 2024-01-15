import 'dart:convert';

UploadImageModel uploadImageModelFromJson(String str) =>
    UploadImageModel.fromJson(json.decode(str));

String uploadImageModelToJson(UploadImageModel data) =>
    json.encode(data.toJson());

class UploadImageModel {
  final int status;
  final String message;
  final List<String> data;

  UploadImageModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UploadImageModel.fromJson(Map<String, dynamic> json) =>
      UploadImageModel(
        status: json["status"],
        message: json["message"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
