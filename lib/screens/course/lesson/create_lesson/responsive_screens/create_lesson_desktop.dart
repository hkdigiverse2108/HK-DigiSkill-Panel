import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/create_lesson/controllers/create_lesson_controller.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/create_lesson/widgets/create_lesson_form.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CreateLessonDesktopScreen extends StatelessWidget {
  const CreateLessonDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateLessonController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdminBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              breadcrumbsItems: [AdminRoutes.cLessons, 'Course Lessons'],
              heading: 'Create Lesson',
            ),
            const Gap(AdminSizes.spaceBtwSections),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: AdminAnimationLoaderWidget(
                    text: 'Loading Faqs',
                    animation: AdminImages.loadingAnimation,
                    height: 200,
                    width: 200,
                  ),
                );
              }
              return CreateLessonForm();
            }),
          ],
        ),
      ),
    );
  }
}
