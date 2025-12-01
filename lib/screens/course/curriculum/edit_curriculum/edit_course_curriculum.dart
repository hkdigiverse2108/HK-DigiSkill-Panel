import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/course_curriculums_model.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/edit_curriculum/responsive_screens/edit_workshop_curriculum_desktop.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/edit_curriculum/responsive_screens/edit_workshop_curriculum_mobile.dart';

class EditCourseCurriculum extends StatelessWidget {
  const EditCourseCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseCurriculumsModel curriculums = Get.arguments;
    return AdminSiteLayouts(
      desktop: EditCourseCurriculumDesktop(curriculums: curriculums),
      mobile: EditCourseCurriculumMobile(curriculums: curriculums),
    );
  }
}
