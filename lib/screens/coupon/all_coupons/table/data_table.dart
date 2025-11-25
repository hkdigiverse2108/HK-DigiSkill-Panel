import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/controllers/all_coupons_controller.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CouponTable extends StatelessWidget {
  const CouponTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AllCouponsController.instance;

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: AdminAnimationLoaderWidget(
            text: 'Loading Faqs',
            animation: AdminImages.loadingAnimation,
            height: 200,
            width: 200,
          ),
        );
      }
      Visibility(
        visible: false,
        child: Text(controller.filteredDataList.length.toString()),
      );
      return AdminPaginatedDataTable(
        minWidth: 800,
        tableHeight: 640,
        dataRowHeight: AdminSizes.xl * 1.8,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: CouponDataSource(),
        columns: [
          const DataColumn2(label: Text("Title")),
          const DataColumn2(label: Text("Code")),
          const DataColumn2(label: Text("Discount")),
          const DataColumn2(label: Text("Validity"), fixedWidth: 200),
          const DataColumn2(label: Text("Usage")),
          const DataColumn2(label: Text("Applies To")),
          const DataColumn2(label: Text("Status")),
          const DataColumn2(label: Text("Actions"), fixedWidth: 120),
        ],
      );
    });
  }
}
