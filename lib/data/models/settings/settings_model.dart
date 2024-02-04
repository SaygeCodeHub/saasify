import 'dart:convert';

SettingsModel settingsModelFromJson(String str) =>
    SettingsModel.fromJson(json.decode(str));

String settingsModelToJson(SettingsModel data) => json.encode(data.toJson());

class SettingsModel {
  int status;
  String message;
  Data data;

  SettingsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
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
  dynamic timeIn;
  dynamic timeOut;
  dynamic timezone;
  dynamic currency;
  int defaultApprover;
  dynamic overtimeRate;
  dynamic overtimeRatePer;
  int totalMedicalLeaves;
  int totalCasualLeaves;

  Data({
    required this.timeIn,
    required this.timeOut,
    required this.timezone,
    required this.currency,
    required this.defaultApprover,
    required this.overtimeRate,
    required this.overtimeRatePer,
    required this.totalMedicalLeaves,
    required this.totalCasualLeaves,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        timeIn: json["time_in"],
        timeOut: json["time_out"],
        timezone: json["timezone"],
        currency: json["currency"],
        defaultApprover: json["default_approver"],
        overtimeRate: json["overtime_rate"],
        overtimeRatePer: json["overtime_rate_per"],
        totalMedicalLeaves: json["total_medical_leaves"],
        totalCasualLeaves: json["total_casual_leaves"],
      );

  Map<String, dynamic> toJson() => {
        "time_in": timeIn,
        "time_out": timeOut,
        "timezone": timezone,
        "currency": currency,
        "default_approver": defaultApprover,
        "overtime_rate": overtimeRate,
        "overtime_rate_per": overtimeRatePer,
        "total_medical_leaves": totalMedicalLeaves,
        "total_casual_leaves": totalCasualLeaves,
      };
}
