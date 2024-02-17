class AddAnnouncementModel {
  final String message;
  final int status;
  final Map data;

  AddAnnouncementModel(
      {required this.message, required this.status, required this.data});

  factory AddAnnouncementModel.fromJson(Map<String, dynamic> json) {
    return AddAnnouncementModel(
        message: json['message'], status: json['status'], data: json['data']);
  }

  Map<String, dynamic> toJson() {
    return {"message": message, "status": status, "data": data};
  }
}
