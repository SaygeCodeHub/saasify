import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({super.key});

  @override
  BarcodeScreenState createState() => BarcodeScreenState();
}

class BarcodeScreenState extends State<BarcodeScreen> {
  TextEditingController textController = TextEditingController();
  String barcodeSvg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: 'Enter text'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _generateRandomBarcode,
              child: const Text('Generate Random Barcode'),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Center(
                child: barcodeSvg.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            SvgPicture.string(
                              barcodeSvg,
                              width: 200,
                              height: 100,
                            ),
                            ElevatedButton(
                                onPressed: () {}, child: const Text('Print'))
                          ])
                    : const Text('Generate a barcode'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _generateRandomBarcode() {
    // Generate a random string for the barcode data
    final String randomBarcodeData = textController.text == ''
        ? generateRandomString(12)
        : textController.text;

    // Generate a random barcode type
    final Random random = Random();
    final List<Barcode> barcodeTypes = [
      Barcode.code128(),
    ];
    final Barcode randomBarcodeType =
        barcodeTypes[random.nextInt(barcodeTypes.length)];

    // Generate the barcode SVG
    setState(() {
      barcodeSvg = randomBarcodeType.toSvg(randomBarcodeData);
    });
  }

  String generateRandomString(int length) {
    const chars = '0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(
          random.nextInt(chars.length),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:saasify/utils/generateBarcode/barcode_screen.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Barcode Generator',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const BarcodeScreen(),
//     );
//   }
// }