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
  final DateTime timezone;
  final dynamic currency;
  final DefaultApprover defaultApprover;
  final dynamic overtimeRate;
  final String overtimeRatePer;
  final int totalMedicalLeaves;
  final int totalCasualLeaves;
  final bool geoFencing;

  SettingsData(
      {required this.timeIn,
      required this.timeOut,
      required this.timezone,
      required this.currency,
      required this.defaultApprover,
      required this.overtimeRate,
      required this.overtimeRatePer,
      required this.totalMedicalLeaves,
      required this.totalCasualLeaves,
      required this.geoFencing});

  factory SettingsData.fromJson(Map<String, dynamic> json) => SettingsData(
      timeIn: DateTime.parse(json["time_in"]),
      timeOut: DateTime.parse(json["time_out"]),
      timezone: DateTime.parse(json["timezone"]),
      currency: json["currency"],
      defaultApprover: DefaultApprover.fromJson(json["default_approver"]),
      overtimeRate: json["overtime_rate"],
      overtimeRatePer: json["overtime_rate_per"],
      totalMedicalLeaves: json["total_medical_leaves"],
      totalCasualLeaves: json["total_casual_leaves"],
      geoFencing: json["geo_fencing"]);

  Map<String, dynamic> toJson() => {
        "time_in": timeIn.toIso8601String(),
        "time_out": timeOut.toIso8601String(),
        "timezone": timezone.toIso8601String(),
        "currency": currency,
        "default_approver": defaultApprover.toJson(),
        "overtime_rate": overtimeRate,
        "overtime_rate_per": overtimeRatePer,
        "total_medical_leaves": totalMedicalLeaves,
        "total_casual_leaves": totalCasualLeaves,
        "geo_fencing": geoFencing
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
