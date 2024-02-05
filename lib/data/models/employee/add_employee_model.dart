import 'dart:convert';

UpdateEmployeeModel addEmployeeModelFromJson(String str) =>
    UpdateEmployeeModel.fromJson(json.decode(str));

String addEmployeeModelToJson(UpdateEmployeeModel data) =>
    json.encode(data.toJson());

class UpdateEmployeeModel {
  int status;
  String message;
  Data data;

  UpdateEmployeeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateEmployeeModel.fromJson(Map<String, dynamic> json) =>
      UpdateEmployeeModel(
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
