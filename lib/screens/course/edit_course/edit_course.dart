import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/responsive_screens/edit_course_desktop.dart';

class EditCourseScreen extends StatelessWidget {
  const EditCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseModel courseModel = Get.arguments;
    return AdminSiteLayouts(
      desktop: EditCourseDesktopScreen(courseModel: courseModel),
    );
  }
}
