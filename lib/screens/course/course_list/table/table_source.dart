import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';

class CourseTableSource extends DataTableSource {
  final controller = CourseListController.instance;

  @override
  DataRow? getRow(int index) {
    final course = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(course.name)),
        DataCell(Text(course.courseCategoryId.name)),
        DataCell(
          Text(
            course.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataCell(Text('₹ ${course.price}')),
        DataCell(Text('₹ ${course.mrpPrice}')),
        DataCell(Text(course.language)),
        DataCell(Text(course.satisfactionRate.toString())),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () =>
                Get.toNamed(AdminRoutes.editCourse, arguments: course),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: "Delete Course",
                message: "Are you sure you want to delete this Curriculums?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteCourse(course.id),
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
