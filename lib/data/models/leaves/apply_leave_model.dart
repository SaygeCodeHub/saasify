import 'dart:convert';

ApplyLeaveModel applyLeaveModelFromJson(String str) =>
    ApplyLeaveModel.fromJson(json.decode(str));

String applyLeaveModelToJson(ApplyLeaveModel data) =>
    json.encode(data.toJson());

class ApplyLeaveModel {
  final int status;
  final String message;
  final Data data;

  ApplyLeaveModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApplyLeaveModel.fromJson(Map<String, dynamic> json) =>
      ApplyLeaveModel(
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
  final int leaveId;
  final String leaveStatus;
  final bool isLeaveApproved;
  final dynamic comment;

  Data({
    required this.leaveId,
    required this.leaveStatus,
    required this.isLeaveApproved,
    required this.comment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
