import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/configs/app_spacing.dart';

class GrandTotalWidget extends pw.StatelessWidget {
  final double grandTotal;
  final double roundedGrandTotal;
  final double roundOffDifference;

  GrandTotalWidget(
      this.grandTotal, this.roundedGrandTotal, this.roundOffDifference);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
      pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('Round off',
                style: const pw.TextStyle(fontSize: spacingSmall)),
            pw.Text('Grand Total',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
          ]),
      pw.SizedBox(width: spacingXXXLarge),
      pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text(
                '${grandTotal < roundedGrandTotal ? '+' : '-'}${roundOffDifference.toStringAsFixed(2)}',
                style: const pw.TextStyle(fontSize: spacingSmall)),
            pw.Text(grandTotal.toStringAsFixed(2),
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
          ])
    ]);
  }
}
