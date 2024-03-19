import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:saasify/caches/cache.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';
import 'package:saasify/utils/pdf/widgets/customer_info_widget.dart';
import 'package:saasify/utils/pdf/widgets/grand_total_widget.dart';
import 'package:saasify/utils/pdf/widgets/header_widget.dart';
import 'package:saasify/utils/pdf/widgets/footer_widget.dart';
import 'package:saasify/utils/pdf/widgets/retail_bill_gst_percent_item_list_widget.dart';
import 'package:saasify/utils/pdf/widgets/retail_bill_info_widget.dart';
import 'package:saasify/utils/pdf/widgets/tax_summary_widget.dart';

Future<void> generateRetailGSTPercentPDF(BuildContext context) async {
  final Cache cache = getIt<Cache>();
  final List<MenuItem> items = [
    MenuItem(itemName: 'Pizza', quantity: 1, price: 459, gstRate: standardGst),
    MenuItem(itemName: 'Pasta', quantity: 1, price: 359, gstRate: standardGst),
    MenuItem(
        itemName: 'Garlic Bread', quantity: 1, price: 55, gstRate: standardGst),
    MenuItem(
        itemName: 'Clifton Water',
        quantity: 1,
        price: 40,
        gstRate: essentialsGst)
  ];
  final gSTRates = GSTRates(cgstRate: 2.5, sgstRate: 2.5);
  final restaurantInfo = RestaurantInfo(
      gstNo: 'G779AZ69777301',
      restaurantContactNo: 9786247171,
      fssaiLicNo: '76868751381581',
      restaurantName: await cache.getCompanyName());
  final customerInfo = CustomerInfo(
      customerName: 'Joey Tribbiani', customerContactNo: "8976656524");
  final billInfo = BillInfo(
      cashierName: 'Gunther', tokenNo: '45, 57', dineIn: 05, billNo: 1766);
  final double totalQty =
      items.fold(0, (prev, element) => prev + element.quantity);
  final double subTotal = items.fold(
      0, (previousValue, element) => previousValue + element.totalCost!);
  final double cgstValue = calculateTaxValue(subTotal, gSTRates.cgstRate);
  final double sgstValue = calculateTaxValue(subTotal, gSTRates.sgstRate);
  final double grandTotal = subTotal + cgstValue + sgstValue;
  final double roundedGrandTotal = roundOff(grandTotal);
  final double roundOffDifference = grandTotal < roundedGrandTotal
      ? roundOff(grandTotal) - grandTotal
      : grandTotal - roundOff(grandTotal);
  final pw.Document doc = pw.Document();
  doc.addPage(pw.Page(
      pageFormat: PdfPageFormat.a5,
      build: (pw.Context context) {
        return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              HeaderWidget(restaurantInfo),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              CustomerInfoWidget(customerInfo),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              RetailBillInfoWidget(billInfo),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              RetailBillGSTPercentItemListWidget(items),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              TaxSummaryWidget(
                  totalQty, subTotal, cgstValue, sgstValue, gSTRates, 0, 0),
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
