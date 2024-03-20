import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class RetailBillItemListWidget extends pw.StatelessWidget {
  final List<MenuItem> items;

  RetailBillItemListWidget(this.items);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Column(children: [pw.Text('Item')]),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [pw.Text('Qty')]),
                  pw.SizedBox(width: spacingXXXLarge),
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [pw.Text('Price')]),
                  pw.SizedBox(width: spacingXXXLarge),
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [pw.Text('GST')]),
                  pw.SizedBox(width: spacingXXXLarge),
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [pw.Text('Amount')])
                ])
          ]),
      pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween, children: [
        pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [for (var item in items) pw.Text(item.itemName)]),
        pw.Row(children: [
          pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                for (var item in items) pw.Text(item.quantity.toString())
              ]),
          pw.SizedBox(width: spacingLarge),
          pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                for (var item in items) pw.Text(item.price.toStringAsFixed(2))
              ]),
          pw.SizedBox(width: spacingLarge),
          pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                for (var item in items) pw.Text(item.gst.toStringAsFixed(2))
              ]),
          pw.SizedBox(width: spacingLarge),
          pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.end,
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                for (var item in items) pw.Text(item.amount.toStringAsFixed(2))
              ])
        ])
      ])
    ]);
  }
}
