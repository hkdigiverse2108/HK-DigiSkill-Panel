import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class WorkshopTestimonialsDataSource extends DataTableSource {
  final controller = WorkshopTestimonialsController.instance;

  @override
  DataRow? getRow(int index) {
    final item = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        DataCell(
          AdminRoundedImage(
            image: item.image ?? AdminImages.defaultImage,
            width: 50,
            height: 50,
            imageType: item.image == null ? ImageType.asset : ImageType.network,
            padding: AdminSizes.sm,
            borderRadius: AdminSizes.borderRadiusMd,
            backgroundColor: AdminColors.primaryBackground,
          ),
        ),
        DataCell(Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis)),
        DataCell(
          Text(
            item.learningCatalog?.title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataCell(
          Text(item.designation, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        DataCell(Text(item.rate.toString())),
        DataCell(
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                color: item.isFeatured
                    ? Colors.green.withOpacity(0.15)
                    : Colors.grey.withOpacity(0.15),
                borderRadius: BorderRadius.circular(AdminSizes.borderRadiusMd),
                border: Border.all(
                  color: item.isFeatured ? Colors.green : Colors.grey,
                ),
              ),
              child: Text(
                item.isFeatured ? "Featured" : "Normal",
                style: TextStyle(
                  color: item.isFeatured ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () =>
                Get.toNamed(AdminRoutes.wEditTestimonial, arguments: item),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: 'Delete Testimonial',
                message: 'Are you sure you want to delete this testimonial?',
                iconColor: Colors.red,
                onConfirm: () => controller.deleteItem(item.id),
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
