import 'package:flutter/material.dart';

class ModulesScreen extends StatelessWidget {
  static const String routeName = "ModulesScreen";
  const ModulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Modules"),
      ),
    );
  }
}
