import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/create_lesson/responsive_screens/create_lesson_desktop.dart';

class CreateLessonScreen extends StatelessWidget {
  const CreateLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      // mobile: CreateLessonMobileScreen(),
      // tablet: CreateLessonTabletScreen(),
      desktop: CreateLessonDesktopScreen(),
    );
  }
}
