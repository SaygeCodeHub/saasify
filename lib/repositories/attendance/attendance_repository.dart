import 'package:saasify/data/models/attendance/check_in_model.dart';
import 'package:saasify/data/models/attendance/check_out_model.dart';

abstract class AttendanceRepository {
  Future<CheckInModel> checkIn(int employeeId, int branchId, String time);
  Future<CheckOutModel> checkOut(int employeeId, int branchId, String time);
  Future<List<double>> getLatLong();
}
