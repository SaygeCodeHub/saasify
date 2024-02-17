import 'dart:convert';

SettingsModel settingsModelFromJson(String str) =>
    SettingsModel.fromJson(json.decode(str));

String settingsModelToJson(SettingsModel data) => json.encode(data.toJson());

class SettingsModel {
  final int status;
  final String message;
  final SettingsData data;

  SettingsModel(
      {required this.status, required this.message, required this.data});

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
      status: json["status"],
      message: json["message"],
      data: SettingsData.fromJson(json["data"]));

  Map<String, dynamic> toJson() =>
      {"status": status, "message": message, "data": data.toJson()};
}

class SettingsData {
  final DateTime timeIn;
  final DateTime timeOut;
  final dynamic timezone;
  final String currency;
  final DefaultApprover defaultApprover;
  final int workingDays;
  final int totalMedicalLeaves;
  final int totalCasualLeaves;
  final int overtimeRate;
  final String overtimeRatePer;
  final String branchAddress;
  final dynamic pincode;
  final dynamic longitude;
  final dynamic latitude;

  SettingsData(
      {required this.timeIn,
      required this.timeOut,
      required this.timezone,
      required this.currency,
      required this.defaultApprover,
      required this.workingDays,
      required this.totalMedicalLeaves,
      required this.totalCasualLeaves,
      required this.overtimeRate,
      required this.overtimeRatePer,
      required this.branchAddress,
      required this.pincode,
      required this.longitude,
      required this.latitude});

  factory SettingsData.fromJson(Map<String, dynamic> json) => SettingsData(
      timeIn: DateTime.parse(json["time_in"]),
      timeOut: DateTime.parse(json["time_out"]),
      timezone: json["timezone"],
      currency: json["currency"],
      defaultApprover: DefaultApprover.fromJson(json["default_approver"]),
      workingDays: json["working_days"],
      totalMedicalLeaves: json["total_medical_leaves"],
      totalCasualLeaves: json["total_casual_leaves"],
      overtimeRate: json["overtime_rate"],
      overtimeRatePer: json["overtime_rate_per"],
      branchAddress: json["branch_address"],
      pincode: json["pincode"],
      longitude: json["longitude"],
      latitude: json["latitude"]);

  Map<String, dynamic> toJson() => {
        "time_in": timeIn.toIso8601String(),
        "time_out": timeOut.toIso8601String(),
        "timezone": timezone,
        "currency": currency,
        "default_approver": defaultApprover.toJson(),
        "working_days": workingDays,
        "total_medical_leaves": totalMedicalLeaves,
        "total_casual_leaves": totalCasualLeaves,
        "overtime_rate": overtimeRate,
        "overtime_rate_per": overtimeRatePer,
        "branch_address": branchAddress,
        "pincode": pincode,
        "longitude": longitude,
        "latitude": latitude
      };
}

class DefaultApprover {
  final int id;
  final String approverName;

  DefaultApprover({required this.id, required this.approverName});

  factory DefaultApprover.fromJson(Map<String, dynamic> json) =>
      DefaultApprover(id: json["id"], approverName: json["approver_name"]);

  Map<String, dynamic> toJson() => {"id": id, "approver_name": approverName};
}
