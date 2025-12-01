import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/curriculums_list/controllers/workshop_curriculum_controller.dart';

class WorkshopCurriculumsSource extends DataTableSource {
  final controller = WorkshopCurriculumController.instance;

  @override
  DataRow? getRow(int index) {
    final curriculum = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(curriculum.title)),
        DataCell(Text(curriculum.workshopId.title)),
        DataCell(Text(curriculum.description)),
        DataCell(Text(curriculum.duration)),

        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () =>
                Get.toNamed(AdminRoutes.wEditCurriculum, arguments: curriculum),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: "Delete Curriculums",
                message: "Are you sure you want to delete this Curriculums?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteCurriculums(curriculum.id),
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
