import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) =>
    ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) =>
    json.encode(data.toJson());

class ForgotPasswordModel {
  final int status;
  final String message;
  final ForgotPasswordData data;

  ForgotPasswordModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        status: json["status"],
        message: json["message"],
        data: ForgotPasswordData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class ForgotPasswordData {
  ForgotPasswordData();

  factory ForgotPasswordData.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordData();

  Map<String, dynamic> toJson() => {};
}
