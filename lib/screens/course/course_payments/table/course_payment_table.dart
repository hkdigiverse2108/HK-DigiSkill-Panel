import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

import '../controllers/course_payment_controller.dart';
import 'course_payment_table_source.dart' show CoursePaymentTableSource;

class CoursePaymentTable extends StatelessWidget {
  const CoursePaymentTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CoursePaymentController.instance;

    return Obx(() {
      if (controller.isLoading.value) {
        return AdminAnimationLoaderWidget(
          text: "Loading Course Payments",
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
        source: CoursePaymentTableSource(),
        columns: [
          DataColumn(label: const Text("name")),
          DataColumn(label: const Text("Course")),
          DataColumn(label: const Text("Amount")),
          DataColumn(label: const Text("Status")),
          DataColumn(label: const Text("PaymentId")),
          DataColumn(label: const Text("Date")),
        ],
      );
    });
  }
}
