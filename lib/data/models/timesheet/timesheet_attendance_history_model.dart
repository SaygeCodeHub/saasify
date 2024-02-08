import 'dart:convert';

TimesheetModel timeSheetAttendanceHistoryModelFromJson(String str) =>
    TimesheetModel.fromJson(json.decode(str));

String timeSheetAttendanceHistoryModelToJson(TimesheetModel data) =>
    json.encode(data.toJson());

class TimesheetModel {
  final int status;
  final String message;
  final List<TimesheetData> data;

  TimesheetModel(
      {required this.status, required this.message, required this.data});

  factory TimesheetModel.fromJson(Map<String, dynamic> json) => TimesheetModel(
      status: json["status"],
      message: json["message"],
      data: List<TimesheetData>.from(
          json["data"].map((x) => TimesheetData.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson()))
      };
}

class TimesheetData {
  final dynamic checkIn;
  final dynamic checkOut;
  final dynamic date;

  TimesheetData(
      {required this.checkIn, required this.checkOut, required this.date});

  factory TimesheetData.fromJson(Map<String, dynamic> json) => TimesheetData(
      checkIn: json["check_in"] == null
          ? json["check_in"]
          : DateTime.parse(json["check_in"]),
      checkOut: json["check_out"] == null
          ? json["check_out"]
          : DateTime.parse(json["check_out"]),
      date: json["date"] == null ? json["date"] : DateTime.parse(json["date"]));

  Map<String, dynamic> toJson() => {
        "check_in": checkIn == null ? checkIn : checkIn.toIso8601String(),
        "check_out": checkOut == null ? checkOut : checkOut.toIso8601String(),
        "date": date == null
            ? date
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}"
      };
}
