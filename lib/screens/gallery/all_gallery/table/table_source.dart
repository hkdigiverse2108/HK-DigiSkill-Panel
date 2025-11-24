import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/controllers/gallery_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class GalleryDataSource extends DataTableSource {
  final controller = GalleryController.instance;

  @override
  DataRow? getRow(int index) {
    final item = controller.filteredDataList[index];

    final thumbs = item.images.take(3).toList();

    return DataRow2(
      cells: [
        DataCell(Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis)),
        DataCell(
          Row(
            children: [
              for (final img in thumbs) ...[
                AdminRoundedImage(
                  image: img.isEmpty ? AdminImages.defaultImage : img,
                  width: 50,
                  height: 50,
                  imageType: img.isEmpty ? ImageType.asset : ImageType.network,
                  padding: AdminSizes.sm,
                  borderRadius: AdminSizes.borderRadiusMd,
                  backgroundColor: AdminColors.primaryBackground,
                ),
                const SizedBox(width: 6),
              ],
              if (item.images.length > 3)
                Text('+${item.images.length - 3}')
            ],
          ),
        ),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () => Get.toNamed(AdminRoutes.editGallery, arguments: item),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: 'Delete Gallery',
                message: 'Are you sure you want to delete this gallery?',
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
