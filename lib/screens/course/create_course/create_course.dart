import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/course/create_course/responsive_screens/create_course_desktop.dart';

class CreateCourse extends StatelessWidget {
  const CreateCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(desktop: const CreateCourseDesktopScreen());
  }
}
