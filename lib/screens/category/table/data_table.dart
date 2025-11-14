import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/category/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

import '../controllers/category_controller.dart';

class CategoryTable extends StatelessWidget {
  const CategoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Obx(() {
      return AdminPaginatedDataTable(
        minWidth: 700,
        tableHeight: 640,
        dataRowHeight: AdminSizes.xl * 1.6,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: CategoryDataSource(),
        columns: const [
          DataColumn2(label: Text("id")),
          DataColumn2(label: Text("Image")),
          DataColumn2(label: Text("Name")),
          DataColumn2(label: Text("Description")),
          DataColumn2(label: Text("Course Count")),
          DataColumn2(label: Text("Featured")),
          DataColumn2(label: Text("Actions")),
        ],
      );
    });
  }
}
