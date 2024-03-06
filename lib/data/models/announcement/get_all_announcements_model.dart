import 'dart:convert';

GetAllAnnouncementsModel getAllAnnouncementsModelFromJson(String str) =>
    GetAllAnnouncementsModel.fromJson(json.decode(str));

String getAllAnnouncementsModelToJson(GetAllAnnouncementsModel data) =>
    json.encode(data.toJson());

class GetAllAnnouncementsModel {
  final int status;
  final String message;
  final List<Announcement> data;

  GetAllAnnouncementsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllAnnouncementsModel.fromJson(Map<String, dynamic> json) =>
      GetAllAnnouncementsModel(
        status: json["status"],
        message: json["message"],
        data: List<Announcement>.from(
            json["data"].map((x) => Announcement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Announcement {
  final int id;
  final DateTime dueDate;
  final String description;
  final bool isActive;
  final DateTime publishedTime;

  Announcement({
    required this.id,
    required this.dueDate,
    required this.description,
    required this.isActive,
    required this.publishedTime,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        id: json["id"],
        dueDate: DateTime.parse(json["due_date"]),
        description: json["description"],
        isActive: json["is_active"],
        publishedTime: DateTime.parse(
            json["published_time"] ?? DateTime.now().toIso8601String()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "due_date":
            "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "description": description,
        "is_active": isActive,
        "published_time": publishedTime.toIso8601String(),
      };
}
