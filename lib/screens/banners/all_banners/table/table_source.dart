import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/data/models/banner_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/controllers/banners_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class BannersDataSource extends DataTableSource {
  final controller = BannersController.instance;

  @override
  DataRow? getRow(int index) {
    final item = controller.filteredDataList[index];

    Widget imagesCell;
    if (item.type == BannerType.web) {
      imagesCell = Row(
        children: [
          AdminRoundedImage(
            image: item.imagePrimary ?? AdminImages.defaultImage,
            width: 50,
            height: 50,
            imageType: (item.imagePrimary ?? '').isEmpty ? ImageType.asset : ImageType.network,
            padding: AdminSizes.sm,
            borderRadius: AdminSizes.borderRadiusMd,
            backgroundColor: AdminColors.primaryBackground,
          ),
          const SizedBox(width: 8),
          AdminRoundedImage(
            image: item.imageSecondary ?? AdminImages.defaultImage,
            width: 50,
            height: 50,
            imageType: (item.imageSecondary ?? '').isEmpty ? ImageType.asset : ImageType.network,
            padding: AdminSizes.sm,
            borderRadius: AdminSizes.borderRadiusMd,
            backgroundColor: AdminColors.primaryBackground,
          ),
        ],
      );
    } else {
      imagesCell = AdminRoundedImage(
        image: item.imagePrimary ?? AdminImages.defaultImage,
        width: 50,
        height: 50,
        imageType: (item.imagePrimary ?? '').isEmpty ? ImageType.asset : ImageType.network,
        padding: AdminSizes.sm,
        borderRadius: AdminSizes.borderRadiusMd,
        backgroundColor: AdminColors.primaryBackground,
      );
    }

    final titleOrLink = item.type == BannerType.web ? (item.title ?? '-') : (item.link ?? '-');

    return DataRow2(
      cells: [
        DataCell(Text(item.type.name.toUpperCase())),
        DataCell(Text(titleOrLink, maxLines: 1, overflow: TextOverflow.ellipsis)),
        DataCell(imagesCell),
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            onEditPressed: () => Get.toNamed(AdminRoutes.editBanner, arguments: item),
            onDeletePressed: () {
              ConfirmDialog.show(
                title: 'Delete Banner',
                message: 'Are you sure you want to delete this banner?',
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
