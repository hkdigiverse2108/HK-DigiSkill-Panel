import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_action_icon_buttons.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:intl/intl.dart';

class WorkshopDataSource extends DataTableSource {
  final controller = WorkshopController.instance;
  final dateFormat = DateFormat('MMM dd, yyyy');
  final timeFormat = DateFormat('hh:mm a');

  @override
  DataRow? getRow(int index) {
    final workshop = controller.filteredDataList[index];

    return DataRow2(
      cells: [
        // Name with Image
        DataCell(
          Row(
            children: [
              AdminRoundedImage(
                imageType: ImageType.network,
                image: workshop.image,
                width: 50,
                height: 50,
                padding: AdminSizes.sm,
                borderRadius: AdminSizes.borderRadiusMd,
                backgroundColor: AdminColors.primaryBackground,
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      workshop.name,
                      style: Theme.of(
                        Get.context!,
                      ).textTheme.bodyLarge!.apply(color: AdminColors.primary),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (workshop.category != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        workshop.category!,
                        style: Theme.of(Get.context!).textTheme.labelSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),

        // Instructor
        DataCell(Text(workshop.instructor)),

        // Date & Time
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(dateFormat.format(workshop.startDate)),
              Text(
                '${timeFormat.format(workshop.startDate)} - ${timeFormat.format(workshop.endDate)}',
                style: Theme.of(Get.context!).textTheme.labelSmall,
              ),
            ],
          ),
        ),

        // Location
        DataCell(Text(workshop.location ?? 'N/A')),

        // Participants
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              LinearProgressIndicator(
                value: workshop.currentParticipants / workshop.maxParticipants,
                backgroundColor: AdminColors.grey.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(
                  workshop.currentParticipants >= workshop.maxParticipants
                      ? AdminColors.error
                      : AdminColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${workshop.currentParticipants}/${workshop.maxParticipants} (${(workshop.currentParticipants / workshop.maxParticipants * 100).toStringAsFixed(0)}%)',
                style: Theme.of(Get.context!).textTheme.labelSmall,
              ),
            ],
          ),
        ),

        // Status & Actions
        DataCell(
          AdminTableActionIconButtons(
            edit: true,
            delete: true,
            view: true,
            onEditPressed: () {},
            onViewPressed: () {},
            onDeletePressed: () {
              // Show confirmation dialog before deleting
              ConfirmDialog.show(
                title: "Delete Workshop",
                message: "Are you sure you want to delete this workshop?",
                iconColor: Colors.red,
                onConfirm: () => controller.deleteWorkshop(workshop.id),
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
