import 'dart:convert';

InitialiseAppModel initialiseAppModelFromJson(String str) => InitialiseAppModel.fromJson(json.decode(str));

String initialiseAppModelToJson(InitialiseAppModel data) => json.encode(data.toJson());

class InitialiseAppModel {
  final int? status;
  final String? message;
  final Data? data;

  InitialiseAppModel({
    this.status,
    this.message,
    this.data,
  });

  factory InitialiseAppModel.fromJson(Map<String, dynamic> json) => InitialiseAppModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final bool? geoFencing;
  final List<Branch>? branches;
  final List<AccessibleModule>? accessibleModules;
  final List<AccessibleFeature>? accessibleFeatures;

  Data({
    this.geoFencing,
    this.branches,
    this.accessibleModules,
    this.accessibleFeatures,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    geoFencing: json["geo_fencing"],
    branches: json["branches"] == null ? [] : List<Branch>.from(json["branches"]!.map((x) => Branch.fromJson(x))),
    accessibleModules: json["accessible_modules"] == null ? [] : List<AccessibleModule>.from(json["accessible_modules"]!.map((x) => AccessibleModule.fromJson(x))),
    accessibleFeatures: json["accessible_features"] == null ? [] : List<AccessibleFeature>.from(json["accessible_features"]!.map((x) => AccessibleFeature.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "geo_fencing": geoFencing,
    "branches": branches == null ? [] : List<dynamic>.from(branches!.map((x) => x.toJson())),
    "accessible_modules": accessibleModules == null ? [] : List<dynamic>.from(accessibleModules!.map((x) => x.toJson())),
    "accessible_features": accessibleFeatures == null ? [] : List<dynamic>.from(accessibleFeatures!.map((x) => x.toJson())),
  };
}

class AccessibleFeature {
  final String? featureKey;
  final double? featureId;
  final bool? isStatistics;
  final String? title;
  final String? icon;
  final int? value;

  AccessibleFeature({
    this.featureKey,
    this.featureId,
    this.isStatistics,
    this.title,
    this.icon,
    this.value,
  });

  factory AccessibleFeature.fromJson(Map<String, dynamic> json) => AccessibleFeature(
    featureKey: json["feature_key"],
    featureId: json["feature_id"]?.toDouble(),
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

class AccessibleModule {
  final String? moduleKey;
  final int? moduleId;
  final String? title;
  final String? icon;

  AccessibleModule({
    this.moduleKey,
    this.moduleId,
    this.title,
    this.icon,
  });

  factory AccessibleModule.fromJson(Map<String, dynamic> json) => AccessibleModule(
    moduleKey: json["module_key"],
    moduleId: json["module_id"],
    title: json["title"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "module_key": moduleKey,
    "module_id": moduleId,
    "title": title,
    "icon": icon,
  };
}

class Branch {
  final String? branchName;
  final int? branchId;

  Branch({
    this.branchName,
    this.branchId,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    branchName: json["branch_name"],
    branchId: json["branch_id"],
  );

  Map<String, dynamic> toJson() => {
    "branch_name": branchName,
    "branch_id": branchId,
  };
}
