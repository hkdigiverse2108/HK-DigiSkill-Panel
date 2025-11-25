import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/responsive_screens/coupon_desktop.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/responsive_screens/coupon_mobile.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/responsive_screens/coupon_tablet.dart';

class AllCoupons extends StatelessWidget {
  const AllCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CouponMobileScreen(),
      tablet: CouponTabletScreen(),
      desktop: CouponDesktopScreen(),
    );
  }
}
