import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../controllers/course_payment_controller.dart';

class CoursePaymentTableSource extends DataTableSource {
  final controller = CoursePaymentController.instance;

  @override
  DataRow? getRow(int index) {
    final p = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(p.user?.fullName ?? "")),
        DataCell(Text(p.course?.name ?? "")),
        DataCell(Text("₹${p.course?.price?.toStringAsFixed(2) ?? ""}")),
        DataCell(Text(p.paymentStatus ?? "-")),
        DataCell(Text(p.razorpayPaymentId ?? "")),
        DataCell(Text(p.purchaseDate.toString().substring(0, 10))),
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
