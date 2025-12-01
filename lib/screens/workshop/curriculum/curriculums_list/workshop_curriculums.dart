import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/curriculums_list/responsive_screens/workshop_curriculums_desktop.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/curriculums_list/responsive_screens/workshop_curriculums_mobile.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/curriculums_list/responsive_screens/workshop_curriculums_tablet.dart';

class WorkshopCurriculums extends StatelessWidget {
  const WorkshopCurriculums({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      desktop: WorkshopCurriculumsDesktopScreen(),
      tablet: WorkshopCurriculumsTabletScreen(),
      mobile: WorkshopCurriculumsMobileScreen(),
    );
  }
}
