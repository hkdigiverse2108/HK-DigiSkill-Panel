import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/screens/newsletter/all_newsletter/controllers/newsletter_controller.dart';

class NewsletterTableSource extends DataTableSource {
  final controller = NewsletterController.instance;

  @override
  DataRow? getRow(int index) {
    final item = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(item.email)),
        DataCell(Text(item.dateTime.toString())),
        DataCell(
          AdminTableActionIconButtons(
            delete: true,
            edit: false,
            onDeletePressed: () {
              ConfirmDialog.show(
                title: "Delete Subscriber",
                message: "Are you sure you want to delete this email?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteSubscriber(item.id),
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
