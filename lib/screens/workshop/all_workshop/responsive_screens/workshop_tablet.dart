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

class WorkshopTabletScreen extends StatelessWidget {
  const WorkshopTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb and Header
            const AdminBreadcrumbWithHeading(
              breadcrumbsItems: ["Workshops"],
              heading: "Workshop Management",
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
                  // Table Header with Create Button (simplified for tablet)
                  AdminTableHeader(
                    buttonText: "New Workshop",
                    onPressed: () {},
                    searchController:
                        WorkshopController.instance.searchController,
                    onSearchChanged: (query) {
                      // Implement search functionality
                    },
                  ),

                  const Gap(AdminSizes.spaceBtwSections),

                  // Workshop Table (same as desktop but with adjusted columns)
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
