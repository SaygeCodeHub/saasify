import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:decimal/decimal.dart';
import 'package:saasify/utils/pdf/header_widget.dart';

import 'package:saasify/utils/pdf/footer_widget.dart';

class MenuItem {
  final String itemName;
  final int quantity;
  final double price;

  MenuItem({
    required this.itemName,
    required this.quantity,
    required this.price,
  });

  double get amount => quantity * price;
}

class GSTRates {
  final double cgstRate;
  final double sgstRate;

  GSTRates({
    required this.cgstRate,
    required this.sgstRate,
  });
}

class RestaurantInfo {
  final String gstNo;
  final int restaurantContactNo;
  final String fssaiLicNo;
  final String cashierName;

  RestaurantInfo({
    required this.gstNo,
    required this.restaurantContactNo,
    required this.fssaiLicNo,
    required this.cashierName,
  });
}

class CustomerBillInfo {
  final String customerName;
  final int customerContactNo;
  final String tokenNo;
  final int dineIn;
  final int billNo;

  CustomerBillInfo(
      {required this.customerName,
      required this.customerContactNo,
      required this.tokenNo,
      required this.dineIn,
      required this.billNo});
}

double calculateTaxValue(double subTotal, double taxRate) {
  double taxValue = (subTotal * taxRate) / 100;
  return double.parse(taxValue.toStringAsFixed(2));
}

double roundOff(double value) {
  final decimalValue = Decimal.parse(value.toString());
  final roundedValue = decimalValue.round();
  return double.parse(roundedValue.toString());
}

Future<void> generatePDF(BuildContext context) async {
  final List<MenuItem> items = [
    MenuItem(itemName: 'Pizza', quantity: 1, price: 459.00),
    MenuItem(itemName: 'Pasta', quantity: 1, price: 359.00),
    MenuItem(itemName: 'Garlic Bread', quantity: 1, price: 95.00),
  ];

  final gSTRates = GSTRates(cgstRate: 2.5, sgstRate: 2.5);

  final restaurantInfo = RestaurantInfo(
      gstNo: 'G779AZ69777301',
      restaurantContactNo: 9786247171,
      fssaiLicNo: '76868751381581',
      cashierName: 'Gunther');

  final customerBillInfo = CustomerBillInfo(
      customerName: 'Joey Tribbiani',
      customerContactNo: 8976656524,
      tokenNo: '45, 57',
      dineIn: 05,
      billNo: 1766);

  final double subTotal =
      items.fold(0, (previousValue, element) => previousValue + element.amount);
  final double cgstValue = calculateTaxValue(subTotal, gSTRates.cgstRate);
  final double sgstValue = calculateTaxValue(subTotal, gSTRates.sgstRate);
  final double grandTotal = subTotal + cgstValue + sgstValue;
  final double roundedGrandTotal = roundOff(grandTotal);
  final double roundOffDifference = grandTotal < roundedGrandTotal
      ? roundOff(grandTotal) - grandTotal
      : grandTotal - roundOff(grandTotal);
  final pw.Document doc = pw.Document();
  final ByteData data = await rootBundle.load('assets/restaurant_logo.jpg');
  final Uint8List bytes = data.buffer.asUint8List();
  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a5,
      build: (pw.Context context) {
        return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              HeaderWidget(restaurantInfo, bytes),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Name: ${customerBillInfo.customerName}'),
                    pw.Text('Mob No.: ${customerBillInfo.customerContactNo}')
                  ]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                          'Date: ${DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now())}'),
                      pw.Text('Cashier: ${restaurantInfo.cashierName}'),
                    ]),
                pw.SizedBox(width: 30),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Dine In: ${customerBillInfo.dineIn}',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.Text('Bill No.: ${customerBillInfo.billNo}')
                    ]),
              ]),
              pw.Row(children: [
                pw.Text('Token No.: ${customerBillInfo.tokenNo}',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
              ]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(children: [pw.Text('Item')]),
                    pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [pw.Text('Qty')]),
                          pw.SizedBox(width: 30),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [pw.Text('Price')]),
                          pw.SizedBox(width: 30),
                          pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.start,
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [pw.Text('Amount')])
                        ])
                  ]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        for (var item in items) pw.Text(item.itemName)
                      ]),
                  pw.Row(
                    children: [
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            for (var item in items)
                              pw.Text(item.quantity.toString())
                          ]),
                      pw.SizedBox(width: 20),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            for (var item in items)
                              pw.Text(item.price.toStringAsFixed(2))
                          ]),
                      pw.SizedBox(width: 20),
                      pw.Column(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          crossAxisAlignment: pw.CrossAxisAlignment.end,
                          children: [
                            for (var item in items)
                              pw.Text((item.quantity * item.price)
                                  .toStringAsFixed(2))
                          ]),
                    ],
                  ),
                ],
              ),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Row(children: [
                          pw.Text(
                              'Total Qty: ${items.fold(0, (prev, element) => prev + element.quantity).toString()}')
                        ]),
                        pw.Text('CGST'),
                        pw.Text('SGST')
                      ]),
                  pw.SizedBox(width: 30),
                  pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('Subtotal'),
                        pw.Text('${gSTRates.cgstRate}%'),
                        pw.Text('${gSTRates.sgstRate}%'),
                      ]),
                  pw.SizedBox(width: 30),
                  pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text(subTotal.toStringAsFixed(2)), // Total amount
                      pw.Text(cgstValue.toString()),
                      pw.Text(sgstValue.toString()),
                    ],
                  ),
                ],
              ),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Round off',
                          style: const pw.TextStyle(fontSize: 10)),
                      pw.Text('Grand Total',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ]),
                pw.SizedBox(width: 30),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text(
                        '${grandTotal < roundedGrandTotal ? '+' : '-'}${roundOffDifference.toStringAsFixed(2)}',
                        style: const pw.TextStyle(fontSize: 10),
                      ),
                      pw.Text(roundedGrandTotal.toStringAsFixed(2),
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ]),
              ]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              FooterWidget(restaurantInfo),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.5)
            ]);
      },
    ),
  );
  final Uint8List pdfBytes = await doc.save();
  final blob = html.Blob([pdfBytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "bill.pdf")
    ..click();
  html.Url.revokeObjectUrl(url);
}
