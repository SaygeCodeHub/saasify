import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/profile/user_profile_widget.dart';

class WebProfileDropdown extends StatelessWidget {
  final bool isHome;

  const WebProfileDropdown({super.key, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
            customButton: const UserProfileWidget(),
            items: [
              ...MenuItems.firstItems.map((item) => DropdownMenuItem<MenuItem>(
                  value: item, child: MenuItems.buildItem(item)))
            ],
            onChanged: (value) {
              MenuItems.onChanged(context, value!);
            },
            buttonStyleData: ButtonStyleData(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40))),
            dropdownStyleData: DropdownStyleData(
                width: 160,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                offset: const Offset(40, -4)),
            menuItemStyleData: MenuItemStyleData(customHeights: [
              ...List<double>.filled(MenuItems.firstItems.length, 48)
            ], padding: const EdgeInsets.only(left: 16, right: 16))));
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
  static const List<MenuItem> firstItems = [edit];

  static const edit = MenuItem(text: 'View Profile', icon: Icons.edit);

  static Widget buildItem(MenuItem item) {
    return Row(children: [
      Icon(item.icon, size: 16),
      const SizedBox(width: spacingSmall),
      Expanded(child: Text(item.text))
    ]);
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.edit:
        break;
    }
  }
}
