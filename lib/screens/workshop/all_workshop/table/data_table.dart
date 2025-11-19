import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class WorkshopTable extends StatelessWidget {
  const WorkshopTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WorkshopController.instance;

    return Obx(() {
      return AdminPaginatedDataTable(
        minWidth: 1200,
        tableHeight: 700,
        dataRowHeight: AdminSizes.xl * 2.2,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        onPageChanged: (page) {},
        source: WorkshopDataSource(),
        columns: [
          const DataColumn2(label: Text("Workshop")),
          DataColumn2(
            label: const Text("Instructor"),
            onSort: (columnIndex, ascending) {
              controller.sort(columnIndex, ascending);
            },
          ),
          DataColumn2(
            label: const Text("Date & Time"),
            onSort: (columnIndex, ascending) {
              controller.sort(columnIndex, ascending);
            },
            size: ColumnSize.L,
          ),
          const DataColumn2(label: Text("Location")),
          const DataColumn2(label: Text("Participants")),
          const DataColumn2(label: Text("Actions"), fixedWidth: 140),
        ],
      );
    });
  }
}
