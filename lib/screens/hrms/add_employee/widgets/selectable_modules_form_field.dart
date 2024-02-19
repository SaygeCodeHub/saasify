import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/selectable_modules.dart';

class SelectableModulesFormField extends StatelessWidget {
  final List<Map<String, dynamic>> selectedFeatures;
  final void Function(List<Map<String, dynamic>>) onSelected;
  final isRequired = true;

  const SelectableModulesFormField({
    super.key,
    required this.selectedFeatures,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<List<Map<String, dynamic>>>(
        initialValue: selectedFeatures,
        validator: (value) {
          if (value == null || value.isEmpty && isRequired) {
            return 'Please select at least one module';
          }
          return null;
        },
        builder: (FormFieldState<dynamic> state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.20,
                child: SingleChildScrollView(
                  child: FutureBuilder(
                      future: getIt<Cache>().getAvailableModules(),
                      builder: (context, snapshot) {
                        return SelectableModules(
                            modules: snapshot.data ?? [],
                            selectedFeatures: selectedFeatures,
                            onSelected: (features) {
                              onSelected(features);
                              state.didChange(features);
                            });
                      }),
                ),
              ),
              state.hasError
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: spacingXSmall, left: spacingStandard),
                      child: Text(
                        state.errorText.toString(),
                        style:
                            Theme.of(context).textTheme.errorSubtitleTextStyle,
                      ),
                    )
                  : const SizedBox(height: spacingStandard),
            ],
          );
        });
  }
}
