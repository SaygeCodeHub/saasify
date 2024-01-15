import 'package:flutter/material.dart';

class MultiFieldRow extends StatelessWidget {
  final List<Widget> childrenWidgets;

  const MultiFieldRow({super.key, required this.childrenWidgets});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: childrenWidgets,
    );
  }
}
