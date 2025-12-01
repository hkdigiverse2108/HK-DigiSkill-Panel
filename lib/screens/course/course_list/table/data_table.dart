import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CourseTable extends StatelessWidget {
  const CourseTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CourseListController.instance;
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: AdminAnimationLoaderWidget(
            text: 'Loading Curriculums...',
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
        source: CourseTableSource(),
        columns: [
          const DataColumn2(label: Text("Title")),
          const DataColumn2(label: Text("category")),
          const DataColumn2(label: Text("Description")),
          const DataColumn2(label: Text("Price")),
          const DataColumn2(label: Text("satisfactionRate")),
          const DataColumn2(label: Text("Actions"), fixedWidth: 120),
        ],
      );
    });
  }
}
