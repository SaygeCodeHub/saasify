import 'package:flutter/material.dart';

class MultiFieldColumn extends StatelessWidget {
  final List<Widget> childrenWidgets;

  const MultiFieldColumn({super.key, required this.childrenWidgets});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrenWidgets,
    );
  }
}
