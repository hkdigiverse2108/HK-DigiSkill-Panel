import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/lesson_list/controllers/lesson_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/lesson_list/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class LessonTable extends StatelessWidget {
  const LessonTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LessonListController.instance;

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
        dataRowHeight: AdminSizes.xl * 1.5,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: CourseLessonDataSource(),
        columns: const [
          DataColumn2(label: Text("Title")),
          DataColumn2(label: Text("Course")),
          DataColumn2(label: Text("Subtitle")),
          DataColumn2(label: Text("Priority")),
          DataColumn2(label: Text("Lock Status")),
          DataColumn2(label: Text("Actions"), fixedWidth: 120),
        ],
      );
    });
  }
}
