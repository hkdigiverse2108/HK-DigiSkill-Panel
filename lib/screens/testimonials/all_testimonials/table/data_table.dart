import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/screens/testimonials/all_testimonials/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class TestimonialsTable extends StatelessWidget {
  const TestimonialsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TestimonialsController.instance;

    return Obx(() {
      Visibility(
        visible: false,
        child: Text(controller.filteredDataList.length.toString()),
      );
      return AdminPaginatedDataTable(
        minWidth: 1100,
        tableHeight: 640,
        dataRowHeight: AdminSizes.xl * 1.8,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: TestimonialsDataSource(),
        columns: const [
          DataColumn2(label: Text('Image')),
          DataColumn2(label: Text('Name')),
          DataColumn2(label: Text('Designation')),
          DataColumn2(label: Text('Rate')),
          DataColumn2(label: Text('Featured')),
          DataColumn2(label: Text('Actions'), fixedWidth: 120),
        ],
      );
    });
  }
}
