import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class HeaderWidget extends pw.StatelessWidget {
  final RestaurantInfo restaurantInfo;
  final Uint8List logoBytes;

  HeaderWidget(this.restaurantInfo, this.logoBytes);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Image(pw.MemoryImage(logoBytes),
          width: kBillImageWidth,
          height: kBillImageHeight,
          fit: pw.BoxFit.fitWidth),
      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [pw.Text('GST - ${restaurantInfo.gstNo}')]),
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
        pw.Text('Restaurant Contact - ${restaurantInfo.restaurantContactNo}')
      ])
    ]);
  }
}
