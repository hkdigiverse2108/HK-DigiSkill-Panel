import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/data/models/instructor_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/instructors/edit_instructor/widgets/edit_instructor_form.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class EditInstructorDesktopScreen extends StatelessWidget {
  final InstructorModel instructor;

  const EditInstructorDesktopScreen({super.key, required this.instructor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              heading: "Instructor",
              breadcrumbsItems: [AdminRoutes.instructors, "Edit Instructor"],
              returnToPreviousScreen: true,
            ),
            const Gap(AdminSizes.spaceBtwSections),

            AdminRoundedContainer(
              backgroundColor: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
              child: EditInstructorForm(instructor: instructor),
            ),
          ],
        ),
      ),
    );
  }
}
