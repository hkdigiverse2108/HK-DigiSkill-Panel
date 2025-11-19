import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/category/all_category/controllers/category_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CategoryDataSource extends DataTableSource {
  final controller = CategoryController.instance;

  @override
  DataRow? getRow(int index) {
    final category = controller.dataList[index];

    return DataRow2(
      onTap: () {},
      // selected: controller.selectedRows[index],
      // onSelectChanged: (value) {
      //   controller.selectedRows[index] = value ?? false;
      //   notifyListeners();
      // },
      cells: [
        DataCell(
          Row(
            children: [
              AdminRoundedImage(
                imageType: ImageType.network,
                image: category.image,
                width: 50,
                height: 50,
                padding: AdminSizes.sm,
                borderRadius: AdminSizes.borderRadiusMd,
                backgroundColor: AdminColors.primaryBackground,
              ),
              Gap(10),
              Expanded(
                child: Text(
                  category.name,
                  style: Theme.of(
                    Get.context!,
                  ).textTheme.bodyLarge!.apply(color: AdminColors.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Text(
            category.description ?? "Category Description",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        DataCell(Text(category.courseCount.toString())),
        DataCell(Text(category.isFeatured.toString())),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () =>
                Get.toNamed(AdminRoutes.editCategory, arguments: category),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: "Delete Category",
                message: "Are you sure you want to delete this Category?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteCategory(category.id),
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
  int get rowCount => controller.dataList.length;

  @override
  int get selectedRowCount => 0;
}
