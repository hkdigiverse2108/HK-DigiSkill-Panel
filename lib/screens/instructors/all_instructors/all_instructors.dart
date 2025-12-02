import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/instructors/all_instructors/responsive_screens/instructor_desktop.dart';

class AllInstructors extends StatelessWidget {
  const AllInstructors({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(desktop: const InstructorDesktopScreen());
  }
}
