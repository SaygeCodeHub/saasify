import 'package:flutter/material.dart';

@immutable
class Item {
  const Item({
    required this.name,
    required this.uid,
  });
  final String name;
  final String uid;
}
