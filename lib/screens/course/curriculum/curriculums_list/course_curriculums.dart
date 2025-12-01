import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/curriculums_list/responsive_screens/course_curriculums_desktop.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/curriculums_list/responsive_screens/course_curriculums_mobile.dart';

class CourseCurriculums extends StatelessWidget {
  const CourseCurriculums({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      desktop: CourseCurriculumsDesktopScreen(),
      mobile: CourseCurriculumsMobileScreen(),
    );
  }
}
