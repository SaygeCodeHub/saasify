import 'dart:convert';

ViewDataModel viewDataModelFromJson(String str) =>
    ViewDataModel.fromJson(json.decode(str));

String viewDataModelToJson(ViewDataModel data) => json.encode(data.toJson());

class ViewDataModel {
  final int status;
  final String message;
  final ViewData data;

  ViewDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ViewDataModel.fromJson(Map<String, dynamic> json) => ViewDataModel(
        status: json["status"],
        message: json["message"],
        data: ViewData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class ViewData {
  final String tableName;
  final TileData? tileData;
  final List<ColumnDetailsData>? columns;
  final List<Map<String, dynamic>> data;
  final List<UtilityButton>? utilityButtons;

  ViewData({
    required this.tableName,
    required this.tileData,
    required this.columns,
    required this.data,
    required this.utilityButtons,
  });

  factory ViewData.fromJson(Map<String, dynamic> json) => ViewData(
        tableName: json["table_name"],
        tileData: json["tile_data"] == null
            ? null
            : TileData.fromJson(json["tile_data"]),
        columns: json["columns"] == null
            ? null
            : List<ColumnDetailsData>.from(
                json["columns"].map((x) => ColumnDetailsData.fromJson(x))),
        data: List<Map<String, dynamic>>.from(json["view_data"]),
        utilityButtons: (json["utility_buttons"] == null)
            ? []
            : List<UtilityButton>.from(
                json["utility_buttons"].map((x) => UtilityButton.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "table_name": tableName,
        "tile_data": tileData?.toJson(),
        "columns": columns == null
            ? null
            : List<dynamic>.from(columns!.map((x) => x.toJson())),
        "view_data": List<dynamic>.from(data),
        "utility_buttons":
            List<dynamic>.from(utilityButtons!.map((x) => x.toJson())),
      };
}

class ColumnDetailsData {
  final String columnTitle;
  final String dataKey;
  final String dataType;
  final dynamic columnWidth;

  ColumnDetailsData({
    required this.columnTitle,
    required this.dataKey,
    required this.dataType,
    required this.columnWidth,
  });

  factory ColumnDetailsData.fromJson(Map<String, dynamic> json) =>
      ColumnDetailsData(
        columnTitle: json["column_title"],
        dataKey: json["data_key"],
        dataType: json["data_type"],
        columnWidth: json["column_width"],
      );

  Map<String, dynamic> toJson() => {
        "column_title": columnTitle,
        "data_key": dataKey,
        "data_type": dataType,
        "column_width": columnWidth,
      };
}

class TileData {
  final String title;
  final dynamic subtitle;
  final String avatar;
  final String status;

  TileData({
    required this.title,
    required this.subtitle,
    required this.avatar,
    required this.status,
  });

  factory TileData.fromJson(Map<String, dynamic> json) => TileData(
        title: json["title_key"],
        subtitle: json["subtitle_key"],
        avatar: json["avatar_key"],
        status: json["status_key"],
      );

  Map<String, dynamic> toJson() => {
        "title_key": title,
        "subtitle_key": subtitle,
        "avatar_key": avatar,
        "status_key": status,
      };
}

class UtilityButton {
  final String buttonIcon;
  final String buttonAction;
  final String endPoint;
  final String apiMethodType;

  UtilityButton({
    required this.buttonIcon,
    required this.buttonAction,
    required this.endPoint,
    required this.apiMethodType,
  });

  factory UtilityButton.fromJson(Map<String, dynamic> json) => UtilityButton(
        buttonIcon: json["button_icon"],
        buttonAction: json["button_action"],
        endPoint: json["end_point"],
        apiMethodType: json["api_method_type"],
      );

  Map<String, dynamic> toJson() => {
        "button_icon": buttonIcon,
        "button_action": buttonAction,
        "end_point": endPoint,
        "api_method_type": apiMethodType,
      };
}
