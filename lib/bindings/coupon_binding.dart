import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/controllers/all_coupons_controller.dart';
import 'package:hkdigiskill_admin/screens/coupon/create_coupon/controllers/create_coupon_controller.dart';

class CouponBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllCouponsController>(() => AllCouponsController());
    Get.lazyPut<CreateCouponController>(() => CreateCouponController());
    // Get.lazyPut<EditCouponController>(() => EditCouponController());
  }
}
