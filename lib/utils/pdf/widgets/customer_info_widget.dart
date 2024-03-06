import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class CustomerInfoWidget extends pw.StatelessWidget {
  final CustomerInfo customerInfo;

  CustomerInfoWidget(this.customerInfo);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text('Name: ${customerInfo.customerName}'),
          pw.Text('Mob No.: ${customerInfo.customerContactNo}')
        ]);
  }
}
