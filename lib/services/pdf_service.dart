// import 'dart:core';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
//
// class PdfService {
//   Future<void> printPOSInvoicePdf() async {
//     final pdf = pw.Document();
//
//     pdf.addPage(pw.Page(
//         pageFormat: PdfPageFormat.roll80,
//         build: (pw.Context context) {
//           return pw.Column(children: [
//             pw.Text("ChanduRam's", style: const pw.TextStyle(fontSize: 14)),
//             pw.Text("NN Bakers & Provisions",
//                 style:
//                     pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//             pw.Text("Mangalam Arcade,Near Venus Book,",
//                 style: const pw.TextStyle(fontSize: 10)),
//             pw.Text("Dharampeth,Nagpur-440011",
//                 style: const pw.TextStyle(fontSize: 10)),
//             pw.Text("90214-98825/27,98224-66254",
//                 style:
//                     pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold)),
//             pw.Text("FSSAI LICENSE NO 12479625892 ",
//                 style: const pw.TextStyle(fontSize: 10)),
//             pw.Text("GST NO: DF12479625892 ",
//                 style: const pw.TextStyle(fontSize: 10)),
//             pw.Divider(),
//             pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Memo No:23123",
//                       style: const pw.TextStyle(fontSize: 10)),
//                   pw.Text("12-12-2023 19:40",
//                       style: const pw.TextStyle(fontSize: 10))
//                 ]),
//             pw.Divider(),
//             pw.Text("CASH MEMO ",
//                 style:
//                     pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
//             pw.Divider(),
//             pw.Table(columnWidths: {
//               0: const pw.FlexColumnWidth(1),
//               1: const pw.FlexColumnWidth(3),
//               2: const pw.FlexColumnWidth(1),
//               3: const pw.FlexColumnWidth(1),
//               4: const pw.FlexColumnWidth(2),
//               5: const pw.FlexColumnWidth(1),
//             }, children: [
//               pw.TableRow(children: [
//                 pw.Text("Sr no.",
//                     style: pw.TextStyle(
//                         fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                 pw.Text("Description",
//                     style: pw.TextStyle(
//                         fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                 pw.Text("Qty",
//                     style: pw.TextStyle(
//                         fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                 pw.Text("MRP",
//                     style: pw.TextStyle(
//                         fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                 pw.Text("Rate",
//                     style: pw.TextStyle(
//                         fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                 pw.Text("Amt.",
//                     style: pw.TextStyle(
//                         fontSize: 10, fontWeight: pw.FontWeight.bold)),
//               ])
//             ]),
//             pw.Divider(),
//             pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Text("Total",
//                       style: pw.TextStyle(
//                           fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                   pw.Text("21",
//                       style: pw.TextStyle(
//                           fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                   pw.Text("₹ 1599.00",
//                       style: pw.TextStyle(
//                           fontSize: 10, fontWeight: pw.FontWeight.bold)),
//                 ]),
//             pw.Divider(),
//             pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
//               pw.Text("Net Saving: 82.00",
//                   style: pw.TextStyle(
//                       fontSize: 10, fontWeight: pw.FontWeight.bold))
//             ]),
//             pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
//               pw.Text("Sub Total: 1681",
//                   style: const pw.TextStyle(fontSize: 10)),
//             ]),
//             pw.Divider(),
//             pw.Row(mainAxisAlignment: pw.MainAxisAlignment.end, children: [
//               pw.Text("₹ 1681.00",
//                   style: pw.TextStyle(
//                       fontSize: 12, fontWeight: pw.FontWeight.bold))
//             ])
//           ]); // Center
//         })); // Page
//
//     var savedFile = await pdf.save();
//     List<int> fileInts = List.from(savedFile);
//     // AnchorElement(
//     //     href:
//     //         "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(fileInts)}")
//     //   ..setAttribute("download", "invoice.pdf")
//     //   ..click();
//   }
// }
