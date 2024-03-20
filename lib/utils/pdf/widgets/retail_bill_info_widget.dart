import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class RetailBillInfoWidget extends pw.StatelessWidget {
  final BillInfo billInfo;

  RetailBillInfoWidget(this.billInfo);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
            pw.Text(
                'Date: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}'),
            pw.Text('Bill No.: ${billInfo.billNo}')
          ]),
          pw.Text('Cashier: ${billInfo.cashierName}')
        ]);
  }
}
