import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/create_curriculum/responsive_screens/create_course_curriculum_desktop.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/create_curriculum/responsive_screens/create_course_curriculum_mobile.dart';

class CreateCourseCurriculum extends StatelessWidget {
  const CreateCourseCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      desktop: const CreateCourseCurriculumDesktop(),
      mobile: CreateCourseCurriculumMobile(),
    );
  }
}
