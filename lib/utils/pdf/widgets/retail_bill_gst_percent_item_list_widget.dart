import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class RetailBillGSTPercentItemListWidget extends pw.StatelessWidget {
  final List<MenuItem> items;

  RetailBillGSTPercentItemListWidget(this.items);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Qty'),
            pw.SizedBox(width: spacingXXXLarge),
            pw.Text('Price'),
            pw.SizedBox(width: spacingXXXLarge),
            pw.Text('GST%'),
            pw.SizedBox(width: spacingXXXLarge),
            pw.Text('GST'),
            pw.SizedBox(width: spacingXXXLarge),
            pw.Text('Amount')
          ]),
      pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
      for (var item in items)
        pw.Column(children: [
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [pw.Text(item.itemName)]),
          pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(item.quantity.toString()),
                // pw.SizedBox(width: spacingLarge),
                pw.Text(item.price.toStringAsFixed(2)),
                // pw.SizedBox(width: spacingLarge),
                pw.Text('${item.gstRate}%'),
                // pw.SizedBox(width: spacingLarge),
                pw.Text(item.gst.toStringAsFixed(2)),
                // pw.SizedBox(width: spacingLarge),
                pw.Text(item.amount.toStringAsFixed(2))
              ])
        ])
    ]);
  }
}
