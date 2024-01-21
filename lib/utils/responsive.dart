import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>(
    T defaultVal, {
    T? tablets,
    T? desktop,
    T? widescreen,
  }) {
    double wd = MediaQuery.sizeOf(this).width;
    return wd >= 2000
        ? (widescreen ?? desktop ?? defaultVal)
        : wd >= 1500
            ? (desktop ?? tablets ?? defaultVal)
            : wd >= 1000
                ? (tablets ?? defaultVal)
                : defaultVal;
  }
}
