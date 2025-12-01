import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class CourseListDesktopScreen extends StatelessWidget {
  const CourseListDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          children: [
            const AdminBreadcrumbWithHeading(
              heading: "Course",
              breadcrumbsItems: ["Course"],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            AdminRoundedContainer(
              backgroundColor: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Table Header with Create Button
                  AdminTableHeader(
                    buttonText: "Add Course",
                    onPressed: () => Get.toNamed(AdminRoutes.createCourse),
                    searchController:
                        CourseListController.instance.searchController,
                    onSearchChanged: (query) {
                      CourseListController.instance.searchQuery(query);
                    },
                  ),

                  const Gap(AdminSizes.spaceBtwSections),

                  CourseTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
