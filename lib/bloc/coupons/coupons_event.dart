abstract class CouponsEvents {}

class EditCoupons extends CouponsEvents {
  final Map couponsDetailsMap;

  EditCoupons({required this.couponsDetailsMap});
}

class DeleteCoupons extends CouponsEvents {
  final int couponId;

  DeleteCoupons({required this.couponId});
}

class FetchAllCoupons extends CouponsEvents {}

class SaveCoupons extends CouponsEvents {
  final Map couponDetailsMap;

  SaveCoupons({required this.couponDetailsMap});
}
