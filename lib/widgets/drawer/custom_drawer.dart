import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';

import '../user_name_widget.dart';
import '../user_profile_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      color: AppColors.white,
      width: isMobile
          ? MediaQuery.sizeOf(context).width * 0.55
          : MediaQuery.sizeOf(context).width * 0.15,
      height: MediaQuery.sizeOf(context).height,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            isMobile
                ? SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.1,
                    child: const Padding(
                      padding: EdgeInsets.only(left: spacingXXSmall),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserProfileWidget(size: spacingExcel),
                          SizedBox(width: spacingXMedium),
                          UserNameWidget()
                        ],
                      ),
                    ),
                  )
                : SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.057,
                  ),
            const Divider(),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
    );
  }
}
