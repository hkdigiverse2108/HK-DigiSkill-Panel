import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/curriculums_list/controllers/workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/curriculums_list/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class WorkshopCurriculumsDesktopScreen extends StatelessWidget {
  const WorkshopCurriculumsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WorkshopCurriculumController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdminBreadcrumbWithHeading(
              heading: "WorkShop Curriculums",
              breadcrumbsItems: ["WorkShop Curriculums"],
            ),

            const Gap(AdminSizes.spaceBtwSections),

            AdminRoundedContainer(
              backgroundColor: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdminTableHeader(
                    buttonText: "Create Curriculums",
                    onPressed: () => Get.toNamed(AdminRoutes.wCreateCurriculum),
                    searchController: controller.searchController,
                    onSearchChanged: (query) {
                      controller.searchQuery(query);
                    },
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  WorkshopCurriculumsTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
