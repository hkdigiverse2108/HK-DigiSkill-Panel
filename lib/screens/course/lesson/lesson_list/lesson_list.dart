import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/lesson_list/responsive_screens/lesson_list_desktop.dart';

class LessonList extends StatelessWidget {
  const LessonList({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(desktop: LessonListDesktop());
  }
}
