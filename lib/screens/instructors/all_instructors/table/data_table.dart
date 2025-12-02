import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/instructors/all_instructors/controllers/instructor_list_controller.dart';
import 'package:hkdigiskill_admin/screens/instructors/all_instructors/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class InstructorTable extends StatelessWidget {
  const InstructorTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = InstructorListController.instance;

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: AdminAnimationLoaderWidget(
            text: 'Loading Instructors',
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
        source: InstructorDataSource(),
        columns: [
          DataColumn2(label: const Text("Name")),
          DataColumn2(label: const Text("Designation")),
          DataColumn2(label: const Text("LinkedIn"), size: ColumnSize.L),
          const DataColumn2(label: Text("Actions"), fixedWidth: 120),
        ],
      );
    });
  }
}
