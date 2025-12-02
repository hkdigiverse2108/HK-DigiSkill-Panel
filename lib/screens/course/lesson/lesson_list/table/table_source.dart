import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/lesson_list/controllers/lesson_list_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CourseLessonDataSource extends DataTableSource {
  final controller = LessonListController.instance;

  @override
  DataRow? getRow(int index) {
    final lesson = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        // TITLE
        DataCell(
          Text(lesson.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),

        // COURSE
        DataCell(
          Text(
            lesson.courseId?.name ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // SUBTITLE
        DataCell(
          Text(
            lesson.subtitle ?? "-",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        // LOCK STATUS
        DataCell(
          GestureDetector(
            onTap: () {
              // toggle logic if needed
              final updated = lesson.copyWith(lessonLock: !lesson.lessonLock);

              controller.dataList[index] = updated;
              controller.filteredDataList[index] = updated;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                color: lesson.lessonLock
                    ? Colors.red.withOpacity(0.15)
                    : Colors.green.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AdminSizes.borderRadiusMd),
                border: Border.all(
                  color: lesson.lessonLock ? Colors.red : Colors.green,
                ),
              ),
              child: Text(
                lesson.lessonLock ? "Locked" : "Unlocked",
                style: TextStyle(
                  color: lesson.lessonLock ? Colors.red : Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),

        // ACTIONS
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () =>
                Get.toNamed(AdminRoutes.cEditLesson, arguments: lesson),

            onDeletePressed: () {
              ConfirmDialog.show(
                title: "Delete Lesson",
                message: "Are you sure you want to delete this lesson?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteLesson(lesson.id),
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
