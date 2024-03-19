import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class TaxSummaryWidget extends pw.StatelessWidget {
  final double totalQty;
  final double subTotal;
  final double discount;
  final double discountPercent;
  final double cgstValue;
  final double sgstValue;
  final GSTRates gSTRates;

  TaxSummaryWidget(this.totalQty, this.subTotal, this.cgstValue, this.sgstValue,
      this.gSTRates, this.discount, this.discountPercent);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
      pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('Total Qty: ${totalQty.toString()}'),
            pw.Text('Discount'),
            pw.Text('CGST'),
            pw.Text('SGST')
          ]),
      pw.SizedBox(width: spacingXXXLarge),
      pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('Subtotal'),
            pw.Text('$discountPercent%'),
            pw.Text('${gSTRates.cgstRate}%'),
            pw.Text('${gSTRates.sgstRate}%')
          ]),
      pw.SizedBox(width: spacingXXXLarge),
      pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text(subTotal.toStringAsFixed(2)),
            pw.Text(discount.toStringAsFixed(2)),
            pw.Text(cgstValue.toStringAsFixed(2)),
            pw.Text(sgstValue.toStringAsFixed(2))
          ])
    ]);
  }
}
