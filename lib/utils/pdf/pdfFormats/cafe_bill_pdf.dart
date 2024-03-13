import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/data/models/POS/bill_model.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';
import 'package:saasify/utils/pdf/widgets/bill_info_widget.dart';
import 'package:saasify/utils/pdf/widgets/customer_info_widget.dart';
import 'package:saasify/utils/pdf/widgets/grand_total_widget.dart';
import 'package:saasify/utils/pdf/widgets/header_widget.dart';
import 'package:saasify/utils/pdf/widgets/footer_widget.dart';
import 'package:saasify/utils/pdf/widgets/cafe_bill_item_list_widget.dart';
import 'package:saasify/utils/pdf/widgets/tax_summary_widget.dart';

Future<void> generateCafePDF(
  BuildContext context, {
  required List<MenuItem> items,
  required BillModel billModel,
}) async {
  final gSTRates =
      GSTRates(cgstRate: billModel.tax / 2, sgstRate: billModel.tax / 2);

  final restaurantInfo = RestaurantInfo(
      gstNo: 'G779AZ69777301',
      restaurantContactNo: 9786247171,
      fssaiLicNo: '76868751381581');

  final customerInfo = CustomerInfo(
      customerName: 'Joey Tribbiani',
      customerContactNo: billModel.customerPhone);

  final billInfo = BillInfo(
      cashierName: 'Gunther', tokenNo: '45, 57', dineIn: 05, billNo: 1766);

  final double totalQty =
      items.fold(0, (prev, element) => prev + element.quantity);
  final double subTotal =
      items.fold(0, (previousValue, element) => previousValue + element.amount);
  final double cgstValue = calculateTaxValue(subTotal, gSTRates.cgstRate);
  final double sgstValue = calculateTaxValue(subTotal, gSTRates.sgstRate);
  final double discount = subTotal * billModel.discount / 100;
  final double grandTotal = subTotal + cgstValue + sgstValue - discount;
  final double roundedGrandTotal = roundOff(grandTotal);
  final double roundOffDifference = grandTotal < roundedGrandTotal
      ? roundOff(grandTotal) - grandTotal
      : grandTotal - roundOff(grandTotal);
  final pw.Document doc = pw.Document();
  final ByteData data = await rootBundle.load('assets/saasify.png');
  final Uint8List bytes = data.buffer.asUint8List();
  doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a5,
      build: (pw.Context context) {
        return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              HeaderWidget(restaurantInfo, bytes),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              CustomerInfoWidget(customerInfo),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              BillInfoWidget(billInfo),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              CafeBillItemListWidget(items),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              TaxSummaryWidget(totalQty, subTotal, cgstValue, sgstValue,
                  gSTRates, discount, billModel.discount),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              GrandTotalWidget(
                  grandTotal, roundedGrandTotal, roundOffDifference),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              FooterWidget(restaurantInfo),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.5)
            ]);
      }));
  final Uint8List pdfBytes = await doc.save();
  final blob = html.Blob([pdfBytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  html.AnchorElement(href: url)
    ..setAttribute("download", "bill.pdf")
    ..click();
  html.Url.revokeObjectUrl(url);
}
