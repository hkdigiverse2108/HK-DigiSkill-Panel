import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/create_curriculum/responsive_screens/create_workshop_curriculum_desktop.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/create_curriculum/responsive_screens/create_workshop_curriculum_mobile.dart';

class CreateWorkshopCurriculum extends StatelessWidget {
  const CreateWorkshopCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      desktop: const CreateWorkshopCurriculumDesktop(),
      mobile: CreateWorkshopCurriculumMobile(),
    );
  }
}
