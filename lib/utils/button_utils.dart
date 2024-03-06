import 'package:flutter/material.dart';

class ButtonUtils {
  static IconData getButtonIconFromType(String type) {
    switch (type) {
      case 'close':
        return Icons.close;
      default:
        return Icons.add;
    }
  }
}
