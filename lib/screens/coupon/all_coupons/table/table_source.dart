import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/controllers/all_coupons_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:intl/intl.dart';

class CouponDataSource extends DataTableSource {
  final controller = AllCouponsController.instance;
  final dateFormat = DateFormat('MMM dd, yyyy');
  final timeFormat = DateFormat('hh:mm a');

  @override
  DataRow? getRow(int index) {
    final coupon = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(Text(coupon.title)),
        DataCell(Text(coupon.code)),
        DataCell(
          Text(
            (coupon.discountType == CouponType.percentage)
                ? "${coupon.discountValue}%"
                : "₹${coupon.discountValue}",
          ),
        ),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${dateFormat.format(coupon.startDate!)} - ${dateFormat.format(coupon.endDate!)}',
                // style: Theme.of(Get.context!).textTheme.labelSmall,
              ),
            ],
          ),
        ),
        DataCell(Text(coupon.usedCount.toString())),
        DataCell(Text(coupon.appliesTo.toString())),
        DataCell(Text(coupon.status.toString())),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () =>
                Get.toNamed(AdminRoutes.cEditFaq, arguments: coupon),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: "Delete Coupon",
                message: "Are you sure you want to delete this coupon?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteCoupon(coupon.id),
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
