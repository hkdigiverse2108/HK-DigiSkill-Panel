import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/lesson_model.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/edit_lesson/responsive_screens/edit_lesson_desktop.dart';

class EditLessonScreen extends StatelessWidget {
  const EditLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseLessonModel lesson = Get.arguments;

    return AdminSiteLayouts(
      // mobile: EditLessonMobileScreen(lesson: lesson),
      // tablet: EditLessonTabletScreen(lesson: lesson),
      desktop: EditLessonDesktopScreen(lesson: lesson),
    );
  }
}
