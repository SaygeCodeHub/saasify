import 'package:decimal/decimal.dart';

const double essentialsGst = 0;
const double massConsumptionGst = 5;
const double standardGst = 12;
const double standardHighGst = 18;
const double whiteLuxuryDemeritGst = 28;

class MenuItem {
  final String itemName;
  final int quantity;
  final double price;
  final double gstRate;

  MenuItem(
      {required this.itemName,
      required this.quantity,
      required this.price,
      required this.gstRate});

  double get amount => quantity * price;

  double get gst => (quantity * price * gstRate) / 100;
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

  RestaurantInfo(
      {required this.gstNo,
      required this.restaurantContactNo,
      required this.fssaiLicNo});
}

class CustomerInfo {
  final String customerName;
  final int customerContactNo;

  CustomerInfo({required this.customerName, required this.customerContactNo});
}

class BillInfo {
  final String cashierName;
  final String tokenNo;
  final int dineIn;
  final int billNo;

  BillInfo(
      {required this.cashierName,
      required this.tokenNo,
      required this.dineIn,
      required this.billNo});
}

double calculateTaxValue(double subTotal, double taxRate) {
  double taxValue = (subTotal * taxRate) / 100;
  return double.parse(taxValue.toStringAsFixed(2));
}

double calculateGSTValue(int quantity, double price, double gstRate) {
  double taxValue = (quantity * price * gstRate) / 100;
  return double.parse(taxValue.toStringAsFixed(2));
}

double roundOff(double value) {
  final decimalValue = Decimal.parse(value.toString());
  final roundedValue = decimalValue.round();
  return double.parse(roundedValue.toString());
}
