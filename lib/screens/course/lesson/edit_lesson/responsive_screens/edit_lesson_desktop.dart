import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/lesson_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/edit_lesson/controllers/edit_lesson_controller.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/edit_lesson/widgets/edit_lesson_form.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class EditLessonDesktopScreen extends StatelessWidget {
  const EditLessonDesktopScreen({super.key, required this.lesson});

  final CourseLessonModel lesson;

  @override
  Widget build(BuildContext context) {
    final controller = EditLessonController.instance;
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
              if (controller.courseController.isLoading.value) {
                return Center(
                  child: AdminAnimationLoaderWidget(
                    text: 'Loading Faqs',
                    animation: AdminImages.loadingAnimation,
                    height: 200,
                    width: 200,
                  ),
                );
              }
              return EditLessonForm(lesson: lesson);
            }),
          ],
        ),
      ),
    );
  }
}
