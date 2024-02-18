import 'dart:convert';

UpdateSettingsModel updateSettingsModelFromJson(String str) =>
    UpdateSettingsModel.fromJson(json.decode(str));

String updateSettingsModelToJson(UpdateSettingsModel data) =>
    json.encode(data.toJson());

class UpdateSettingsModel {
  final int status;
  final String message;
  final Data data;

  UpdateSettingsModel(
      {required this.status, required this.message, required this.data});

  factory UpdateSettingsModel.fromJson(Map<String, dynamic> json) =>
      UpdateSettingsModel(
          status: json["status"],
          message: json["message"],
          data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() =>
      {"status": status, "message": message, "data": data.toJson()};
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}
