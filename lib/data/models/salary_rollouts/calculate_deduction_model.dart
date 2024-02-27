import 'dart:convert';

CalculateDeductionModel calculateDeductionModelFromJson(String str) =>
    CalculateDeductionModel.fromJson(json.decode(str));

String calculateDeductionModelToJson(CalculateDeductionModel data) =>
    json.encode(data.toJson());

class CalculateDeductionModel {
  final int status;
  final String message;
  final Data data;

  CalculateDeductionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CalculateDeductionModel.fromJson(Map<String, dynamic> json) =>
      CalculateDeductionModel(
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
  final dynamic finalPay;

  Data({
    required this.finalPay,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        finalPay: json["final_pay"],
      );

  Map<String, dynamic> toJson() => {
        "deduction": finalPay,
      };
}
