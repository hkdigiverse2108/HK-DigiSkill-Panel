import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/data/models/workshop_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/workshop/edit_workshop/controllers/edit_workshop_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';

import '../widgets/pdf_selection.dart';
import '../widgets/pricing_section.dart';
import '../widgets/title_description.dart';
import '../widgets/workshop_thumbnail_image.dart';

class EditWorkshopDesktopScreen extends GetView<EditWorkshopController> {
  const EditWorkshopDesktopScreen({super.key, required this.workshop});

  final WorkshopModel workshop;

  @override
  Widget build(BuildContext context) {
    final controller = EditWorkshopController.instance;
    return GetBuilder(
      init: EditWorkshopController(),
      initState: (state) {
        controller.initEditField(workshop);
      },
      builder: (controller) {
        return Scaffold(
          // bottomNavigationBar: const WorkshopBottomNavigationButtons(),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(AdminSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Breadcrumb
                AdminBreadcrumbWithHeading(
                  returnToPreviousScreen: true,
                  heading: 'Update Workshop',
                  breadcrumbsItems: [AdminRoutes.wWorkshops, 'Update Workshop'],
                ),
                const Gap(AdminSizes.spaceBtwSections),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: AdminDeviceUtility.isTabletScreen(context) ? 2 : 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Basic Information
                          const WorkshopTitleAndDescription(),
                          const Gap(AdminSizes.defaultSpace),

                          // Additional Information
                          Container(),
                        ],
                      ),
                    ),
                    Gap(AdminSizes.defaultSpace),
                    Expanded(
                      child: Column(children: [WorkshopThumbnailImage()]),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: AdminDeviceUtility.isTabletScreen(context) ? 2 : 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Basic Information
                          const PricingSection(),
                          const Gap(AdminSizes.defaultSpace),

                          // Additional Information
                          Container(),
                        ],
                      ),
                    ),
                    Gap(AdminSizes.defaultSpace),
                    Expanded(child: Column(children: [PdfSelection()])),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: AdminRoundedContainer(
            radius: 0,
            padding: EdgeInsets.all(AdminSizes.md),
            child: Row(
              children: [
                Expanded(flex: 4, child: SizedBox()),
                Gap(AdminSizes.spaceBtwItems),
                Obx(
                  () => Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AdminColors.primary.withOpacity(0.4),
                      ),
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.initEditField(workshop);
                            },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text("Clear Changes"),
                    ),
                  ),
                ),
                Gap(AdminSizes.spaceBtwItems),
                Obx(
                  () => Expanded(
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.updateWorkshop(workshop);
                            },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text("Update Workshop"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
