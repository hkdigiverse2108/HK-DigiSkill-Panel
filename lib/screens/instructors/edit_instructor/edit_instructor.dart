import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/instructor_model.dart';
import 'package:hkdigiskill_admin/screens/instructors/edit_instructor/responsive_screens/edit_instructor_desktop.dart';

class EditInstructorScreen extends StatelessWidget {
  const EditInstructorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final InstructorModel instructor = Get.arguments;

    return AdminSiteLayouts(
      // mobile: EditInstructorMobileScreen(instructor: instructor),
      // tablet: EditInstructorTabletScreen(instructor: instructor),
      desktop: EditInstructorDesktopScreen(instructor: instructor),
    );
  }
}
