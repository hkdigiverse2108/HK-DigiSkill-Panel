import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/controllers/all_coupons_controller.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class CouponDesktopScreen extends StatelessWidget {
  const CouponDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AllCouponsController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                AdminBreadcrumbWithHeading(
                  heading: "Coupon Code",
                  breadcrumbsItems: ["Coupon Code"],
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            AdminRoundedContainer(
              backgroundColor: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdminTableHeader(
                    buttonText: "Create Coupon",
                    onPressed: () => Get.toNamed(AdminRoutes.createCouponCode),
                    searchController: controller.searchController,
                    onSearchChanged: (query) {
                      controller.searchQuery(query);
                    },
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  const CouponTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
