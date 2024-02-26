class AnnouncementModel {
  final String message;
  final int status;
  final Map data;

  AnnouncementModel(
      {required this.message, required this.status, required this.data});

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AnnouncementModel(
        message: json['message'], status: json['status'], data: json['data']);
  }

  Map<String, dynamic> toJson() {
    return {"message": message, "status": status, "data": data};
  }
}
