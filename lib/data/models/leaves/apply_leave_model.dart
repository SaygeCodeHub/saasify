import 'dart:convert';

ApplyLeaveModel applyLeaveModelFromJson(String str) =>
    ApplyLeaveModel.fromJson(json.decode(str));

String applyLeaveModelToJson(ApplyLeaveModel data) =>
    json.encode(data.toJson());

class ApplyLeaveModel {
  int status;
  String message;
  LeaveData data;

  ApplyLeaveModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApplyLeaveModel.fromJson(Map<String, dynamic> json) =>
      ApplyLeaveModel(
        status: json["status"],
        message: json["message"],
        data: LeaveData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class LeaveData {
  int leaveId;
  int leaveStatus;
  bool isLeaveApproved;
  dynamic comment;

  LeaveData({
    required this.leaveId,
    required this.leaveStatus,
    required this.isLeaveApproved,
    required this.comment,
  });

  factory LeaveData.fromJson(Map<String, dynamic> json) => LeaveData(
        leaveId: json["leave_id"],
        leaveStatus: json["leave_status"],
        isLeaveApproved: json["is_leave_approved"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "leave_id": leaveId,
        "leave_status": leaveStatus,
        "is_leave_approved": isLeaveApproved,
        "comment": comment,
      };
}
