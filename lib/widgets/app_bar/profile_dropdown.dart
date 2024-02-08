import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/screens/authentication/auth/auhentication_screen.dart';
import 'package:saasify/screens/settings/settings_screen.dart';
import 'package:saasify/widgets/profile/user_profile_widget.dart';

import '../profile/user_name_widget.dart';

class WebProfileDropdown extends StatelessWidget {
  const WebProfileDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserProfileWidget(),
              SizedBox(width: spacingXMedium),
              UserNameWidget()
            ]),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value!);
        },
        buttonStyleData: ButtonStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          width: 160,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          offset: const Offset(40, -4),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48)
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

class MenuItems {
  static const List<MenuItem> firstItems = [edit, settings, logOut];

  static const edit = MenuItem(text: 'Edit Profile', icon: Icons.edit);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logOut = MenuItem(text: 'Logout', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, size: 16),
        const SizedBox(width: spacingSmall),
        Expanded(child: Text(item.text)),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.edit:
        break;
      case MenuItems.settings:
        Navigator.pushNamed(context, SettingsScreen.routeName);
        break;
      case MenuItems.logOut:
        getIt<Cache>().clearSharedPreferences();
        Navigator.pushNamedAndRemoveUntil(
            context, AuthenticationScreen.routeName, (route) => false);
        break;
    }
  }
}