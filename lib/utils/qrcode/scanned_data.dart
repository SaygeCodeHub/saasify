import 'package:flutter/material.dart';

class ScannedData extends StatelessWidget {
  static const String routeName = 'scannedData';
  final String qrcodeValue;

  const ScannedData({super.key, required this.qrcodeValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanned Data: $qrcodeValue'),
      ),
      body: Center(
        child: Text(qrcodeValue),
      ),
    );
  }
}
