import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/workshop_curriculums_model.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/edit_curriculum/responsive_screens/edit_workshop_curriculum_desktop.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/edit_curriculum/responsive_screens/edit_workshop_curriculum_mobile.dart';

class EditWorkshopCurriculum extends StatelessWidget {
  const EditWorkshopCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkshopCurriculumsModel curriculums = Get.arguments;
    return AdminSiteLayouts(
      desktop: EditWorkshopCurriculumDesktop(curriculums: curriculums),
      mobile: EditWorkshopCurriculumMobile(curriculums: curriculums),
    );
  }
}
