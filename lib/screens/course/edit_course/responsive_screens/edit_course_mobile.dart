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

import '../../../workshop/curriculum/edit_curriculum/widgets/pdf_selection.dart';

class EditCourseMobileScreen extends StatelessWidget {
  const EditCourseMobileScreen({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  Widget build(BuildContext context) {
    final controller = EditCourseController.instance;
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
                        text: 'Loading Curriculums...',
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
  }

  Widget formSection(BuildContext context, CourseModel courseModel) {
    return Column(
      children: [
        const EditTitleSection(),
        const Gap(AdminSizes.defaultSpace),

        EditSelectImage(),
        const Gap(AdminSizes.defaultSpace),
        PdfSelection(),
        const Gap(AdminSizes.defaultSpace),
        EditPriceSection(courseModel: courseModel),
      ],
    );
  }
}
