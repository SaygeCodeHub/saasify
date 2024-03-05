import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> generatePDF(BuildContext context) async {
  final pw.Document doc = pw.Document();
  final image = (Image.asset("assets/restaurant_logo.jpg"));
  doc.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a5,
      build: (pw.Context context) {
        return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Image(pw.MemoryImage(image as Uint8List),
                        width: 150, height: 150, fit: pw.BoxFit.cover),
                    pw.Text('GST-'),
                    pw.Text('Contact-'),
                  ]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(children: [pw.Text('Name-'), pw.Text('(M-)')]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.start, children: [
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Date:'),
                      pw.Text('Cashier:'),
                    ]),
                pw.SizedBox(width: 30),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [pw.Text('Dine In:'), pw.Text('Bill No.:')]),
              ]),
              pw.Row(children: [
                pw.Text('Token No.:',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
              ]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(children: [pw.Text('Item')]),
                    pw.Column(children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('Qty'),
                            pw.SizedBox(width: 25),
                            pw.Text('Price'),
                            pw.SizedBox(width: 25),
                            pw.Text('Amount')
                          ])
                    ])
                  ]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(children: [pw.Text('Pizza')]),
                    pw.Column(children: [
                      pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('1'),
                            pw.SizedBox(width: 25),
                            pw.Text('350.00'),
                            pw.SizedBox(width: 25),
                            pw.Text('350.00')
                          ])
                    ])
                  ]),
              pw.SizedBox(height: 10),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Total Qty:'),
                      pw.Text('CGST'),
                      pw.Text('SGST')
                    ]),
                pw.SizedBox(width: 30),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Subtotal'),
                      pw.Text('2.5%'),
                      pw.Text('2.5%')
                    ]),
                pw.SizedBox(width: 30),
                pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('350.00'),
                      pw.Text('8.75'),
                      pw.Text('8.75')
                    ]),
              ]),
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
                      pw.Text('+0.50', style: const pw.TextStyle(fontSize: 10)),
                      pw.Text('368.00',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ]),
              ]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.75),
              pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text('FSSAI Lic No.'),
                    pw.Text('Thank You!'),
                  ]),
              pw.Divider(indent: 1, endIndent: 1, thickness: 0.5),
            ]);
      },
    ),
  );
  final Uint8List bytes = await doc.save();
  final blob = html.Blob([bytes]);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.AnchorElement(href: url)
    ..setAttribute("download", "bill.pdf")
    ..click();
  html.Url.revokeObjectUrl(url);
}
