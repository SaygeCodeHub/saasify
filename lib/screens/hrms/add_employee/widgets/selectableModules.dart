import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/initialise/initialise_app_model.dart';

class SelectableModules extends StatefulWidget {
  final List<ModulesModel> modules;
  final List<Map<String, dynamic>>? selectedFeatures;
  final void Function(List<Map<String, dynamic>>) onSelected;

  const SelectableModules({
    super.key,
    required this.modules,
    required this.onSelected,
    this.selectedFeatures,
  });

  @override
  State<SelectableModules> createState() => _SelectableModulesState();
}

class _SelectableModulesState extends State<SelectableModules> {
  List<Map<String, dynamic>> selectedFeatures = [];

  @override
  void initState() {
    selectedFeatures = widget.selectedFeatures ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.modules.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ModuleItem(
          module: widget.modules[index],
          selectedFeatures: selectedFeatures,
          onSelected: (features) {
            setState(() {
              selectedFeatures = features;
              widget.onSelected(selectedFeatures);
            });
          },
        );
      },
    );
  }
}

class ModuleItem extends StatelessWidget {
  final ModulesModel module;
  final List<Map<String, dynamic>> selectedFeatures;
  final void Function(List<Map<String, dynamic>>) onSelected;

  const ModuleItem({
    super.key,
    required this.module,
    required this.selectedFeatures,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: spacingStandard),
        Row(
          children: [
            Text(
              module.title ?? "",
              style: Theme.of(context)
                  .textTheme
                  .labelTextStyle
                  .copyWith(color: AppColors.darkBlue),
            ),
            Checkbox(
              value: _allFeaturesSelected(module),
              onChanged: (value) {
                _handleModuleSelection(value);
              },
              activeColor: AppColors.lightBlue,
            ),
          ],
        ),
        const SizedBox(height: spacingSmall),
        Wrap(
          spacing: spacingXXSmall,
          runSpacing: spacingXXSmall,
          children: module.availableFeatures?.map((feature) {
                return FeatureChip(
                    feature: feature,
                    isSelected: _isSelectedFeature(feature),
                    onSelected: (value) {
                      _handleFeatureSelection(value, feature);
                    });
              }).toList() ??
              [],
        ),
      ],
    );
  }

  bool _isSelectedFeature(FeatureDetailModel feature) {
    return selectedFeatures.any((element) => element["accessible_features"]
        .any((element) => element["feature_id"] == feature.featureId));
  }

  bool _allFeaturesSelected(ModulesModel module) {
    if (selectedFeatures
        .any((element) => element["module_id"] == module.moduleId)) {
      var selectedModule = selectedFeatures
          .firstWhere((element) => element["module_id"] == module.moduleId);
      return selectedModule["accessible_features"].length ==
          module.availableFeatures?.length;
    }
    return false;
  }

  void _handleModuleSelection(bool? value) {
    if (value!) {
      var moduleMap = module.toJson();
      moduleMap.remove("available_features");
      moduleMap["accessible_features"] =
          module.availableFeatures?.map((e) => e.toJson()).toList();
      selectedFeatures
          .removeWhere((element) => element["module_id"] == module.moduleId);
      selectedFeatures.add(moduleMap);
    } else {
      selectedFeatures
          .removeWhere((element) => element["module_id"] == module.moduleId);
    }
    onSelected(selectedFeatures);
  }

  void _handleFeatureSelection(bool selected, FeatureDetailModel feature) {
    if (selected) {
      var featureMap = feature.toJson();
      if (selectedFeatures
          .any((element) => element["module_id"] == module.moduleId)) {
        var selectedModule = selectedFeatures
            .firstWhere((element) => element["module_id"] == module.moduleId);
        selectedModule["accessible_features"].add(featureMap);
      } else {
        var moduleMap = module.toJson();
        moduleMap.remove("available_features");
        moduleMap["accessible_features"] = [featureMap];
        selectedFeatures.add(moduleMap);
      }
    } else {
      var featureId = feature.featureId;
      var moduleToRemove = selectedFeatures.firstWhere((element) =>
          element["accessible_features"]
              .any((element) => element["feature_id"] == featureId));
      moduleToRemove["accessible_features"]
          .removeWhere((element) => element["feature_id"] == featureId);
      if (moduleToRemove["accessible_features"].isEmpty) {
        selectedFeatures.remove(moduleToRemove);
      }
    }
    onSelected(selectedFeatures);
  }
}

class FeatureChip extends StatelessWidget {
  final FeatureDetailModel feature;
  final bool isSelected;
  final void Function(bool) onSelected;

  const FeatureChip({
    super.key,
    required this.feature,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: isSelected,
      selectedColor: AppColors.lightBlue.withOpacity(0.1),
      checkmarkColor: AppColors.lightBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: AppColors.grey,
      side: BorderSide(
        color:
            isSelected ? AppColors.lightBlue : AppColors.black.withOpacity(0.2),
      ),
      label: Text(
        feature.title ?? "",
        style: Theme.of(context).textTheme.labelTextStyle.copyWith(
              color: isSelected
                  ? AppColors.lightBlue
                  : AppColors.black.withOpacity(0.5),
            ),
      ),
      onSelected: onSelected,
    );
  }
}
