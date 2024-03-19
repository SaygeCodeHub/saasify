import 'dart:convert';

FetchDetailsModel fetchDetailsModelFromJson(String str) =>
    FetchDetailsModel.fromJson(json.decode(str));

String fetchDetailsModelToJson(FetchDetailsModel data) =>
    json.encode(data.toJson());

class FetchDetailsModel {
  final int status;
  final String message;
  final Data? data;

  FetchDetailsModel(
      {required this.status, required this.message, required this.data});

  factory FetchDetailsModel.fromJson(Map<String, dynamic> json) =>
      FetchDetailsModel(
          status: json["status"],
          message: json["message"],
          data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() =>
      {"status": status, "message": message, "data": data?.toJson()};
}

class Data {
  final String heading;
  final List<UtilityButton> utilityButtons;
  final List<Section> sections;

  Data(
      {required this.heading,
      required this.utilityButtons,
      required this.sections});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        heading: json['heading'] ?? '',
        utilityButtons: List<UtilityButton>.from((json["utility_buttons"] ==
                null)
            ? []
            : json["utility_buttons"].map((x) => UtilityButton.fromJson(x))),
        sections: List<Section>.from((json["sections"] == null)
            ? []
            : json["sections"].map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "utility_buttons":
            List<dynamic>.from(utilityButtons.map((x) => x.toJson())),
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
      };
}

class Section {
  final String avatar;
  final String title;
  final String subtitle;
  final List<Detail> details;

  Section(
      {required this.avatar,
      required this.title,
      required this.subtitle,
      required this.details});

  factory Section.fromJson(Map<String, dynamic> json) => Section(
      avatar: json["avatar"] ?? '',
      title: json["title"] ?? '',
      subtitle: json["subtitle"] ?? '',
      details: List<Detail>.from((json["details"] == null)
          ? []
          : json["details"].map((x) => Detail.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "title": title,
        "subtitle": subtitle,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Detail {
  final String label;
  final String value;

  Detail({required this.label, required this.value});

  factory Detail.fromJson(Map<String, dynamic> json) =>
      Detail(label: json["label"] ?? '', value: json["value"] ?? '');

  Map<String, dynamic> toJson() => {"label": label, "value": value};
}

class UtilityButton {
  final String buttonIcon;
  final String buttonAction;
  final String endPoint;
  final String apiMethodType;

  UtilityButton(
      {required this.buttonIcon,
      required this.buttonAction,
      required this.endPoint,
      required this.apiMethodType});

  factory UtilityButton.fromJson(Map<String, dynamic> json) => UtilityButton(
      buttonIcon: json["button_icon"] ?? '',
      buttonAction: json["button_action"] ?? '',
      endPoint: json["end_point"] ?? '',
      apiMethodType: json["api_method_type"] ?? '');

  Map<String, dynamic> toJson() => {
        "button_icon": buttonIcon,
        "button_action": buttonAction,
        "end_point": endPoint,
        "api_method_type": apiMethodType
      };
}
