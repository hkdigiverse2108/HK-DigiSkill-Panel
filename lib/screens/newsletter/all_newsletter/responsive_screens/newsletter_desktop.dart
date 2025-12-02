import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/newsletter/all_newsletter/controllers/newsletter_controller.dart';
import 'package:hkdigiskill_admin/screens/newsletter/all_newsletter/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class NewsletterDesktopScreen extends StatelessWidget {
  const NewsletterDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NewsletterController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          children: [
            const AdminBreadcrumbWithHeading(
              heading: "Newsletter Subscriptions",
              breadcrumbsItems: ["Newsletter"],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            AdminRoundedContainer(
              child: Column(
                children: [
                  AdminTableHeader(
                    buttonText: "Add Subscriber",
                    onPressed: () => Get.toNamed(AdminRoutes.createNewsLetter),
                    searchController: controller.searchController,
                    onSearchChanged: controller.searchQuery,
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  const NewsletterTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
