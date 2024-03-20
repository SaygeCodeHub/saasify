import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';

class HeaderWidget extends pw.StatelessWidget {
  final RestaurantInfo restaurantInfo;

  HeaderWidget(this.restaurantInfo);

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(children: [
      pw.Text(restaurantInfo.restaurantName,
          style: pw.Theme.of(context).header3.copyWith()),
      pw.SizedBox(height: spacingSmall),
      pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [pw.Text('GST - ${restaurantInfo.gstNo}')]),
      pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
        pw.Text('Restaurant Contact - ${restaurantInfo.restaurantContactNo}')
      ])
    ]);
  }
}
