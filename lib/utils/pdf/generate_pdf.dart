import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pdf;

Future<void> generatePDF(BuildContext context) async {
  final pdf.Document doc = pdf.Document();
  final image = Image.asset('assets.saasify.png');
  doc.addPage(
    pdf.Page(
      pageFormat: PdfPageFormat.a5,
      build: (pdf.Context context) {
        return pdf.Center(
          child: pdf.Column(children: [
            pdf.Center(child: pdf.Image(
                pdf.MemoryImage(image as Uint8List), width: 150,
                height: 150,
                fit: pdf.BoxFit.cover)),
            pdf.Text('Your Bill Details')
          ]),
        );
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
