import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  static const routeName = 'ComingSoonScreen';
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}
