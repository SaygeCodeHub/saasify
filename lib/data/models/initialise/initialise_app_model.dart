import 'dart:convert';

InitialiseAppModel initialiseAppModelFromJson(String str) =>
    InitialiseAppModel.fromJson(json.decode(str));

String initialiseAppModelToJson(InitialiseAppModel data) =>
    json.encode(data.toJson());

class InitialiseAppModel {
  final int? status;
  final String? message;
  final InitialiseAppData? data;

  InitialiseAppModel({
    this.status,
    this.message,
    this.data,
  });

  factory InitialiseAppModel.fromJson(Map<String, dynamic> json) =>
      InitialiseAppModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : InitialiseAppData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class InitialiseAppData {
  final List<ListOfBranches>? branches;
  final List<BleModule>? accessibleModules;
  final List<BleModule>? availableModules;
  final bool? geoFencing;

  InitialiseAppData({
    this.branches,
    this.accessibleModules,
    this.availableModules,
    this.geoFencing,
  });

  factory InitialiseAppData.fromJson(Map<String, dynamic> json) =>
      InitialiseAppData(
        branches: json["branches"] == null
            ? []
            : List<ListOfBranches>.from(
                json["branches"]!.map((x) => ListOfBranches.fromJson(x))),
        accessibleModules: json["accessible_modules"] == null
            ? []
            : List<BleModule>.from(
                json["accessible_modules"]!.map((x) => BleModule.fromJson(x))),
        availableModules: json["available_modules"] == null
            ? []
            : List<BleModule>.from(
                json["available_modules"]!.map((x) => BleModule.fromJson(x))),
        geoFencing: json["geo_fencing"],
      );

  Map<String, dynamic> toJson() => {
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
        "accessible_modules": accessibleModules == null
            ? []
            : List<dynamic>.from(accessibleModules!.map((x) => x.toJson())),
        "available_modules": availableModules == null
            ? []
            : List<dynamic>.from(availableModules!.map((x) => x.toJson())),
        "geo_fencing": geoFencing,
      };
}

class BleModule {
  final String? moduleKey;
  final int? moduleId;
  final String? title;
  final String? icon;
  final List<FeatureDetailModel>? accessibleFeatures;
  final List<FeatureDetailModel>? availableFeatures;

  BleModule({
    this.moduleKey,
    this.moduleId,
    this.title,
    this.icon,
    this.accessibleFeatures,
    this.availableFeatures,
  });

  factory BleModule.fromJson(Map<String, dynamic> json) => BleModule(
        moduleKey: json["module_key"],
        moduleId: json["module_id"],
        title: json["title"],
        icon: json["icon"],
        accessibleFeatures: json["accessible_features"] == null
            ? []
            : List<FeatureDetailModel>.from(json["accessible_features"]!
                .map((x) => FeatureDetailModel.fromJson(x))),
        availableFeatures: json["available_features"] == null
            ? []
            : List<FeatureDetailModel>.from(json["available_features"]!
                .map((x) => FeatureDetailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "module_key": moduleKey,
        "module_id": moduleId,
        "title": title,
        "icon": icon,
        "accessible_features": accessibleFeatures == null
            ? []
            : List<dynamic>.from(accessibleFeatures!.map((x) => x.toJson())),
        "available_features": availableFeatures == null
            ? []
            : List<dynamic>.from(availableFeatures!.map((x) => x.toJson())),
      };
}

class FeatureDetailModel {
  final String? featureKey;
  final double? featureId;
  final bool? isStatistics;
  final String? title;
  final String? icon;
  final String? value;

  FeatureDetailModel({
    this.featureKey,
    this.featureId,
    this.isStatistics,
    this.title,
    this.icon,
    this.value,
  });

  factory FeatureDetailModel.fromJson(Map<String, dynamic> json) =>
      FeatureDetailModel(
        featureKey: json["feature_key"],
        featureId: json["feature_id"],
        isStatistics: json["is_statistics"],
        title: json["title"],
        icon: json["icon"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "feature_key": featureKey,
        "feature_id": featureId,
        "is_statistics": isStatistics,
        "title": title,
        "icon": icon,
        "value": value,
      };
}

class ListOfBranches {
  final String? branchName;
  final int? branchId;

  ListOfBranches({
    this.branchName,
    this.branchId,
  });

  factory ListOfBranches.fromJson(Map<String, dynamic> json) => ListOfBranches(
        branchName: json["branch_name"],
        branchId: json["branch_id"],
      );

  Map<String, dynamic> toJson() => {
        "branch_name": branchName,
        "branch_id": branchId,
      };
}
