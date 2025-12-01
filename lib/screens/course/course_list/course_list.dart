import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/responsive_screens/course_list_desktop.dart';

class CourseList extends StatelessWidget {
  const CourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(desktop: const CourseListDesktopScreen());
  }
}
