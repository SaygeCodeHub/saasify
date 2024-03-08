import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/utils/qrcode/qr_scanner_overlay.dart';
import 'package:saasify/utils/qrcode/scanned_data.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => QRScannerState();
}

class QRScannerState extends State<QRScanner> {
  MobileScannerController cameraController = MobileScannerController();
  String? qrcodeValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: qrcodeValue != null
            ? Text('Scanned: $qrcodeValue')
            : const Text('QRScanner'),
        actions: [
          IconButton(
              onPressed: () {
                cameraController.switchCamera();
              },
              icon: const Icon(Icons.camera_rear_outlined))
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: (qrcode, args) {
              setState(() {
                qrcodeValue = qrcode.rawValue;
              });
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.pushReplacementNamed(
                  context,
                  ScannedData.routeName,
                  arguments: qrcodeValue,
                );
              });
            },
          ),
          QRScannerOverlay(overlayColour: AppColors.black.withOpacity(0.5))
        ],
      ),
    );
  }
}
