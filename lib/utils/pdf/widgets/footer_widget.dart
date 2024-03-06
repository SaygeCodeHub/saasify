import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class FooterWidget extends pw.StatelessWidget {
  final RestaurantInfo restaurantInfo;

  FooterWidget(this.restaurantInfo);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Text('FSSAI Lic No.:${restaurantInfo.fssaiLicNo}'),
          pw.Text('Thank You!')
        ]);
  }
}
