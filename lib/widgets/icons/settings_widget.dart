import 'package:flutter/material.dart';
import 'package:saasify/screens/settings/settings_screen.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pushNamed(context, SettingsScreen.routeName);
        },
        icon: const Icon(Icons.settings));
  }
}
