import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;
import 'cafe_bill_pdf.dart';

class HeaderWidget extends pw.StatelessWidget {
  final RestaurantInfo restaurantInfo;
  final Uint8List logoBytes;

  HeaderWidget(this.restaurantInfo, this.logoBytes);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Image(pw.MemoryImage(logoBytes),
          width: 100, height: 75, fit: pw.BoxFit.cover),
      pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Text('GST - ${restaurantInfo.gstNo}'),
        ],
      ),
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
        pw.Text('Restaurant Contact - ${restaurantInfo.restaurantContactNo}'),
      ])
    ]);
  }
}
