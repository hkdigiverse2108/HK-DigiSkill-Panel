import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/instructors/create_instructor/responsive_screens/create_instructor_desktop.dart';

class CreateInstructorScreen extends StatelessWidget {
  const CreateInstructorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      // mobile: CreateInstructorMobileScreen(),
      // tablet: CreateInstructorTabletScreen(),
      desktop: CreateInstructorDesktopScreen(),
    );
  }
}
