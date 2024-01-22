import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) =>
    RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) =>
    json.encode(data.toJson());

class RegisterUserModel {
  int status;
  String message;
  RegisterData data;

  RegisterUserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      RegisterUserModel(
        status: json["status"],
        message: json["message"],
        data: RegisterData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class RegisterData {
  int? userId;
  List<dynamic>? company; // Make company nullable

  RegisterData({
    this.userId,
    this.company, // Make company nullable
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        userId: json["user_id"],
        company: json["company"] != null
            ? List<dynamic>.from(json["company"].map((x) => x))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "company": company,
      };
}
