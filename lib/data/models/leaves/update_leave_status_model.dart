import 'dart:convert';

UpdateLeaveStatusModel updateLeaveStatusModelFromJson(String str) =>
    UpdateLeaveStatusModel.fromJson(json.decode(str));

String updateLeaveStatusModelToJson(UpdateLeaveStatusModel data) =>
    json.encode(data.toJson());

class UpdateLeaveStatusModel {
  int status;
  String message;
  Data data;

  UpdateLeaveStatusModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateLeaveStatusModel.fromJson(Map<String, dynamic> json) =>
      UpdateLeaveStatusModel(
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
