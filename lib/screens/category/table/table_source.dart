import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/screens/category/controllers/category_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class CategoryDataSource extends DataTableSource {
  final controller = CategoryController.instance;

  @override
  DataRow? getRow(int index) {
    final category = controller.dataList[index];

    return DataRow2(
      onTap: () {},
      selected: controller.selectedRows[index],
      onSelectChanged: (value) =>
          controller.selectedRows[index] = value ?? false,
      cells: [
        DataCell(Text(category.id.toString())),
        DataCell(
          AdminRoundedImage(
            imageType: ImageType.network,
            image: AdminImages.profile,
            width: 40,
            height: 40,
            padding: 2,
          ),
        ),
        DataCell(Text(category.name)),
        DataCell(Text(category.description ?? "Category Description")),
        DataCell(Text(category.courseCount.toString())),
        DataCell(Text(category.isFeatured.toString())),
        DataCell(
          Row(
            children: [
              IconButton(icon: const Icon(Iconsax.eye), onPressed: () {}),
              IconButton(
                icon: const Icon(Iconsax.trash, color: AdminColors.error),
                onPressed: () {},
              ),
            ],
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
