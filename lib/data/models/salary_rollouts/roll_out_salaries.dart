import 'dart:convert';

RolloutSalariesModel rolloutSalariesModelFromJson(String str) =>
    RolloutSalariesModel.fromJson(json.decode(str));

String rolloutSalariesModelToJson(RolloutSalariesModel data) =>
    json.encode(data.toJson());

class RolloutSalariesModel {
  final int status;
  final String message;
  final Data data;

  RolloutSalariesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RolloutSalariesModel.fromJson(Map<String, dynamic> json) =>
      RolloutSalariesModel(
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
