import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/data/models/course_curriculums_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/edit_curriculum/controllers/edit_workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';

import '../widgets/pdf_selection.dart';
import '../widgets/resource_section.dart';
import '../widgets/title_description.dart';
import '../widgets/video_thumbnail_image.dart' show VideoThumbnailImage;

class EditCourseCurriculumDesktop
    extends GetView<EditCourseCurriculumController> {
  const EditCourseCurriculumDesktop({super.key, required this.curriculums});

  final CourseCurriculumsModel curriculums;

  @override
  Widget build(BuildContext context) {
    final controller = EditCourseCurriculumController.instance;
    return GetBuilder(
      init: EditCourseCurriculumController(),
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
                    AdminRoutes.cCurriculum,
                    "Update Course Curriculum",
                  ],
                ),
                const Gap(AdminSizes.spaceBtwSections),
                Obx(
                  () => (controller.courseController.isLoading.value)
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
                              controller.updateCourseCurriculum(curriculums);
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: AdminDeviceUtility.isTabletScreen(context) ? 2 : 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Basic Information
                  const CurriculumTitleAndDescription(),
                  const Gap(AdminSizes.defaultSpace),

                  // Additional Information
                  Container(),
                ],
              ),
            ),
            Gap(AdminSizes.defaultSpace),
            Expanded(child: Column(children: [VideoThumbnailImage()])),
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
                  const ResourceSection(),
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
    );
  }
}
