import 'dart:convert';

LoadApplyLeaveModel loadApplyLeaveModelFromJson(String str) => LoadApplyLeaveModel.fromJson(json.decode(str));

String loadApplyLeaveModelToJson(LoadApplyLeaveModel data) => json.encode(data.toJson());

class LoadApplyLeaveModel {
  int status;
  String message;
  ApplyLeaveData data;

  LoadApplyLeaveModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoadApplyLeaveModel.fromJson(Map<String, dynamic> json) => LoadApplyLeaveModel(
    status: json["status"],
    message: json["message"],
    data: ApplyLeaveData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ApplyLeaveData {
  int casualLeaves;
  int medicalLeaves;
  List<int> approvers;

  ApplyLeaveData({
    required this.casualLeaves,
    required this.medicalLeaves,
    required this.approvers,
  });

  factory ApplyLeaveData.fromJson(Map<String, dynamic> json) => ApplyLeaveData(
    casualLeaves: json["casual_leaves"],
    medicalLeaves: json["medical_leaves"],
    approvers: List<int>.from(json["approvers"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "casual_leaves": casualLeaves,
    "medical_leaves": medicalLeaves,
    "approvers": List<dynamic>.from(approvers.map((x) => x)),
  };
}
