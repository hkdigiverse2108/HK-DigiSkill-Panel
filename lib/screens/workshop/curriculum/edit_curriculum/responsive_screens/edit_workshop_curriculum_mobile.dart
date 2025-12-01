import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/data/models/workshop_curriculums_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/create_curriculum/widgets/resource_section.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/create_curriculum/widgets/title_description.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/create_curriculum/widgets/video_thumbnail_image.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/edit_curriculum/controllers/edit_workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

import '../widgets/pdf_selection.dart';

class EditWorkshopCurriculumMobile
    extends GetView<EditWorkshopCurriculumController> {
  const EditWorkshopCurriculumMobile({super.key, required this.curriculums});

  final WorkshopCurriculumsModel curriculums;

  @override
  Widget build(BuildContext context) {
    final controller = EditWorkshopCurriculumController.instance;
    return GetBuilder(
      init: EditWorkshopCurriculumController(),
      initState: (state) {
        controller.initFields(curriculums);
      },
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(AdminSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdminBreadcrumbWithHeading(
                  heading: "Update Curriculum",
                  returnToPreviousScreen: true,
                  breadcrumbsItems: [
                    AdminRoutes.wCurriculum,
                    "Update Workshop Curriculum",
                  ],
                ),
                const Gap(AdminSizes.spaceBtwSections),
                Obx(
                  () => (controller.workshopController.isLoading.value)
                      ? Center(
                          child: AdminAnimationLoaderWidget(
                            text: 'Loading Curriculums...',
                            animation: AdminImages.loadingAnimation,
                            height: 200,
                            width: 200,
                          ),
                        )
                      : formSection(context),
                ),
              ],
            ),
          ),
          bottomNavigationBar: AdminRoundedContainer(
            radius: 0,
            padding: EdgeInsets.all(AdminSizes.md),
            child: Row(
              children: [
                Obx(
                  () => Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AdminColors.primary.withOpacity(0.4),
                      ),
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.initFields(curriculums);
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
                              controller.updateWorkshopCurriculum(curriculums);
                            },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text("Update Curriculum"),
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

  Widget formSection(BuildContext context) {
    return Column(
      children: [
        const CurriculumTitleAndDescription(),
        Gap(AdminSizes.defaultSpace),
        VideoThumbnailImage(),
        Gap(AdminSizes.defaultSpace),
        const ResourceSection(),
        Gap(AdminSizes.defaultSpace),
        PdfSelection(),
      ],
    );
  }
}
