import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/course/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/screens/course/faq/all_faq/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CourseFaqTable extends StatelessWidget {
  const CourseFaqTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CourseFaqController.instance;

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
        minWidth: 1000,
        tableHeight: 640,
        dataRowHeight: AdminSizes.xl * 1.8,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: CourseFaqDataSource(),
        columns: [
          const DataColumn2(label: Text("Course")),
          const DataColumn2(label: Text("Question")),
          DataColumn2(
            label: const Text("Answer"),
            onSort: (columnIndex, ascending) {
              controller.sort(columnIndex, ascending);
            },
            size: ColumnSize.L,
          ),
          const DataColumn2(label: Text("Featured")),
          const DataColumn2(label: Text("Actions"), fixedWidth: 120),
        ],
      );
    });
  }
}
