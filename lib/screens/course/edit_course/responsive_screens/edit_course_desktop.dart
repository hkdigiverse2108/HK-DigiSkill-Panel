import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/controllers/edit_course_controller.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/widgets/price_section.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/widgets/select_image.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/widgets/title_section.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';

class EditCourseDesktopScreen extends GetView<EditCourseController> {
  const EditCourseDesktopScreen({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditCourseController(),
      initState: (state) {
        controller.initCourseData(courseModel);
      },
      builder: (controller) {
        return Scaffold(
          body: SingleChildScrollView(
            padding: EdgeInsets.all(AdminSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdminBreadcrumbWithHeading(
                  heading: "Update Course",
                  returnToPreviousScreen: true,
                  breadcrumbsItems: [AdminRoutes.course, "Update Course"],
                ),
                Gap(AdminSizes.spaceBtwSections),
                Obx(
                  () => (controller.categoryController.isLoading.value)
                      ? Center(
                          child: AdminAnimationLoaderWidget(
                            text: 'Loading Course...',
                            animation: AdminImages.loadingAnimation,
                            height: 200,
                            width: 200,
                          ),
                        )
                      : formSection(context, courseModel),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget formSection(BuildContext context, CourseModel courseModel) {
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
                  const EditTitleSection(),
                  const Gap(AdminSizes.defaultSpace),

                  // Additional Information
                  Container(),
                ],
              ),
            ),
            Gap(AdminSizes.defaultSpace),
            Expanded(child: Column(children: [EditSelectImage()])),
          ],
        ),
        EditPriceSection(courseModel: courseModel),
      ],
    );
  }
}
