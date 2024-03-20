import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/screenArguments/no_data_screen_arguments.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

class NoDataFoundScreen extends StatelessWidget {
  final NoDataScreenArguments args;
  static const String routeName = 'NoDataFoundScreen';

  const NoDataFoundScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        showDrawer: true,
        childScreenBuilder: (isMobile) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 60, color: AppColors.orange),
                const SizedBox(height: spacingXSmall),
                Text(args.heading ?? "No Data Found",
                    style: Theme.of(context).textTheme.noDataFoundHeading),
                const SizedBox(height: spacingXXSmall),
                args.message == null || args.message!.isEmpty
                    ? const SizedBox()
                    : Text(args.message!,
                        style: Theme.of(context).textTheme.noDataFoundMessage),
                args.message == null || args.message!.isEmpty
                    ? const SizedBox()
                    : const SizedBox(height: spacingXSmall),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"),
                ),
              ],
            ),
          );
        });
  }
}
