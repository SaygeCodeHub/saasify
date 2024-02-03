import 'package:flutter/material.dart';

class CustomDatePicker {
  static Future<DateTime?> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101, 12, 31),
    );
    return picked;
  }
}
