import 'dart:convert';

ApplyLeaveModel applyLeaveModelFromJson(String str) =>
    ApplyLeaveModel.fromJson(json.decode(str));

String applyLeaveModelToJson(ApplyLeaveModel data) =>
    json.encode(data.toJson());

class ApplyLeaveModel {
  final int status;
  final String message;
  final Data data;

  ApplyLeaveModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApplyLeaveModel.fromJson(Map<String, dynamic> json) =>
      ApplyLeaveModel(
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
