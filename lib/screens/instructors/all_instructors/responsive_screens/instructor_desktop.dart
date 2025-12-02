import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/instructors/all_instructors/controllers/instructor_list_controller.dart';
import 'package:hkdigiskill_admin/screens/instructors/all_instructors/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class InstructorDesktopScreen extends StatelessWidget {
  const InstructorDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = InstructorListController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              heading: "Instructors",
              breadcrumbsItems: ["Instructors"],
            ),
            const Gap(AdminSizes.spaceBtwSections),

            /// TABLE WRAPPER
            AdminRoundedContainer(
              backgroundColor: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
              child: Column(
                children: [
                  AdminTableHeader(
                    buttonText: "Create Instructor",
                    onPressed: () => Get.toNamed(AdminRoutes.createInstructor),
                    searchController: controller.searchController,
                    onSearchChanged: controller.searchQuery,
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  const InstructorTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
