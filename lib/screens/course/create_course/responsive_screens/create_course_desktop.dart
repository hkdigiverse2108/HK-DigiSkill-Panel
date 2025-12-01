import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/create_course/controllers/create_course_controller.dart';
import 'package:hkdigiskill_admin/screens/course/create_course/widgets/price_section.dart';
import 'package:hkdigiskill_admin/screens/course/create_course/widgets/select_image.dart';
import 'package:hkdigiskill_admin/screens/course/create_course/widgets/title_section.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';

class CreateCourseDesktopScreen extends StatelessWidget {
  const CreateCourseDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateCourseController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdminBreadcrumbWithHeading(
              heading: "Create Course",
              returnToPreviousScreen: true,
              breadcrumbsItems: [AdminRoutes.course, "Create Course"],
            ),
            Gap(AdminSizes.spaceBtwSections),
            Obx(
              () => (controller.categoryController.isLoading.value)
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
                  const TitleSection(),
                  const Gap(AdminSizes.defaultSpace),

                  // Additional Information
                  Container(),
                ],
              ),
            ),
            Gap(AdminSizes.defaultSpace),
            Expanded(child: Column(children: [SelectImage()])),
          ],
        ),
        const PriceSection(),
      ],
    );
  }
}
