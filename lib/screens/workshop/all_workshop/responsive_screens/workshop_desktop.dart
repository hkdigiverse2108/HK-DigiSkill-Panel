import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class WorkshopDesktopScreen extends StatelessWidget {
  const WorkshopDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb and Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const AdminBreadcrumbWithHeading(
                  heading: "Workshop Management",
                  breadcrumbsItems: ["Workshops"],
                ),

                // Add filter/sort options here if needed
              ],
            ),
            const Gap(AdminSizes.spaceBtwSections),

            // Table Section
            AdminRoundedContainer(
              backgroundColor: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Table Header with Create Button
                  AdminTableHeader(
                    buttonText: "Create Workshop",
                    onPressed: () {},
                    searchController:
                        WorkshopController.instance.searchController,
                    onSearchChanged: (query) {
                      WorkshopController.instance.searchQuery(query);
                    },
                  ),

                  const Gap(AdminSizes.spaceBtwSections),

                  // Workshop Table
                  const WorkshopTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
