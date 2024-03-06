import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class TaxSummaryWidget extends pw.StatelessWidget {
  final double totalQty;
  final double subTotal;
  final double cgstValue;
  final double sgstValue;
  final GSTRates gSTRates;

  TaxSummaryWidget(this.totalQty, this.subTotal, this.cgstValue, this.sgstValue,
      this.gSTRates);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
      pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('Total Qty: ${totalQty.toString()}'),
            pw.Text('CGST'),
            pw.Text('SGST')
          ]),
      pw.SizedBox(width: spacingXXXLarge),
      pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('Subtotal'),
            pw.Text('${gSTRates.cgstRate}%'),
            pw.Text('${gSTRates.sgstRate}%')
          ]),
      pw.SizedBox(width: spacingXXXLarge),
      pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text(subTotal.toStringAsFixed(2)), // Total amount
            pw.Text(cgstValue.toStringAsFixed(2)),
            pw.Text(sgstValue.toStringAsFixed(2))
          ])
    ]);
  }
}
