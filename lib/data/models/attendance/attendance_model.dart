import 'dart:convert';

AttendanceModel getAttendanceModelFromJson(String str) => AttendanceModel.fromJson(json.decode(str));

String getAttendanceModelToJson(AttendanceModel data) => json.encode(data.toJson());

class AttendanceModel {
  final int status;
  final String message;
  final Data data;

  AttendanceModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
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
  final DateTime? checkIn;
  final DateTime? checkOut;

  Data({
    required this.checkIn,
    required this.checkOut,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    checkIn: json["check_in"] == null ? null : DateTime.parse(json["check_in"]),
    checkOut: json["check_out"] == null ? null : DateTime.parse(json["check_out"]),
  );

  Map<String, dynamic> toJson() => {
    "check_in": checkIn?.toIso8601String(),
    "check_out": checkOut?.toIso8601String(),
  };
}
