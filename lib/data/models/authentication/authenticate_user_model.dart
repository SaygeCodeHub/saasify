import 'dart:convert';

AuthenticateUserModel authenticateUserModelFromJson(String str) =>
    AuthenticateUserModel.fromJson(json.decode(str));

String authenticateUserModelToJson(AuthenticateUserModel data) =>
    json.encode(data.toJson());

class AuthenticateUserModel {
  String status;
  String message;
  AuthenticateUserData? data;

  AuthenticateUserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthenticateUserModel.fromJson(Map<String, dynamic> json) =>
      AuthenticateUserModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null
            ? AuthenticateUserData.fromJson(json["data"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class AuthenticateUserData {
  int? userId;
  List<dynamic>? company;

  AuthenticateUserData({
    required this.userId,
    required this.company,
  });

  factory AuthenticateUserData.fromJson(Map<String, dynamic> json) =>
      AuthenticateUserData(
        userId: json["user_id"],
        company: json["company"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "company": company,
      };
}
