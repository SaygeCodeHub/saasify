import 'dart:convert';

TimeSheetAttendanceHistoryModel timeSheetAttendanceHistoryModelFromJson(
        String str) =>
    TimeSheetAttendanceHistoryModel.fromJson(json.decode(str));

String timeSheetAttendanceHistoryModelToJson(
        TimeSheetAttendanceHistoryModel data) =>
    json.encode(data.toJson());

class TimeSheetAttendanceHistoryModel {
  final int status;
  final String message;
  final List<TimeSheetAttendanceHistoryData> data;

  TimeSheetAttendanceHistoryModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TimeSheetAttendanceHistoryModel.fromJson(Map<String, dynamic> json) =>
      TimeSheetAttendanceHistoryModel(
        status: json["status"],
        message: json["message"],
        data: List<TimeSheetAttendanceHistoryData>.from(json["data"]
            .map((x) => TimeSheetAttendanceHistoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TimeSheetAttendanceHistoryData {
  final DateTime checkIn;
  final DateTime checkOut;
  final DateTime date;

  TimeSheetAttendanceHistoryData({
    required this.checkIn,
    required this.checkOut,
    required this.date,
  });

  factory TimeSheetAttendanceHistoryData.fromJson(Map<String, dynamic> json) =>
      TimeSheetAttendanceHistoryData(
        checkIn: DateTime.parse(json["check_in"]),
        checkOut: DateTime.parse(json["check_out"]),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "check_in": checkIn.toIso8601String(),
        "check_out": checkOut.toIso8601String(),
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}
