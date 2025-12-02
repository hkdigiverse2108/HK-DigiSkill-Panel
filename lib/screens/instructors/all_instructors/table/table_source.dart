import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/instructors/all_instructors/controllers/instructor_list_controller.dart';

class InstructorDataSource extends DataTableSource {
  final controller = InstructorListController.instance;

  @override
  DataRow? getRow(int index) {
    final item = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis)),
        DataCell(
          Text(
            item.designation ?? "-",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataCell(
          Text(
            item.linkedin?.isEmpty ?? true ? "-" : item.linkedin!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () =>
                Get.toNamed(AdminRoutes.editInstructor, arguments: item),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: "Delete Instructor",
                message: "Are you sure you want to delete this instructor?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteInstructor(item.id),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => controller.filteredDataList.length;

  @override
  int get selectedRowCount => 0;
}
