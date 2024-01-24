import 'dart:convert';

InviteEmployeeModel inviteModelFromJson(String str) =>
    InviteEmployeeModel.fromJson(json.decode(str));

String inviteModelToJson(InviteEmployeeModel data) =>
    json.encode(data.toJson());

class InviteEmployeeModel {
  int status;
  String message;
  Data data;

  InviteEmployeeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory InviteEmployeeModel.fromJson(Map<String, dynamic> json) =>
      InviteEmployeeModel(
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
