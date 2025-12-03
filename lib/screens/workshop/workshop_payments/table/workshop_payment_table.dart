import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/workshop/workshop_payments/table/workshop_payment_table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

import '../controllers/workshop_payment_controller.dart';

class WorkshopPaymentTable extends StatelessWidget {
  const WorkshopPaymentTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WorkshopPaymentController.instance;

    return Obx(() {
      if (controller.isLoading.value) {
        return AdminAnimationLoaderWidget(
          text: "Loading Workshop Payments",
          animation: AdminImages.loadingAnimation,
          height: 200,
          width: 200,
        );
      }
      Visibility(
        visible: false,
        child: Text(controller.filteredDataList.length.toString()),
      );
      return AdminPaginatedDataTable(
        minWidth: 1100,
        tableHeight: 650,
        dataRowHeight: AdminSizes.xl * 1.8,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        source: WorkshopPaymentTableSource(),
        columns: [
          DataColumn(label: const Text("User")),
          DataColumn(label: const Text("Workshop")),
          DataColumn(label: const Text("Amount")),
          DataColumn(label: const Text("Status")),
          DataColumn(label: const Text("Method")),
          DataColumn(label: const Text("Date")),
        ],
      );
    });
  }
}
