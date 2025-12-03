import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../controllers/workshop_payment_controller.dart';

class WorkshopPaymentTableSource extends DataTableSource {
  final controller = WorkshopPaymentController.instance;

  @override
  DataRow? getRow(int index) {
    final p = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(p.user.name)),
        DataCell(Text(p.workshop.title)),
        DataCell(Text("₹${p.finalAmount.toStringAsFixed(2)}")),
        DataCell(Text(p.paymentStatus)),
        DataCell(Text(p.paymentMethod)),
        DataCell(Text(p.transactionDate.toString().substring(0, 10))),
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
