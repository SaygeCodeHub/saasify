import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class BillInfoWidget extends pw.StatelessWidget {
  final BillInfo billInfo;

  BillInfoWidget(this.billInfo);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
        pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                  'Date: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}'),
              pw.Text('Cashier: ${billInfo.cashierName}')
            ]),
        pw.SizedBox(width: spacingXXXLarge),
        pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Dine In: ${billInfo.dineIn}',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Bill No.: ${billInfo.billNo}')
            ])
      ]),
      pw.Row(children: [
        pw.Text('Token No.: ${billInfo.tokenNo}',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
      ])
    ]);
  }
}
