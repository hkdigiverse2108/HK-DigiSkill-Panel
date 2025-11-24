import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/table_header.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/screens/testimonials/all_testimonials/table/data_table.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class TestimonialsDesktopScreen extends StatelessWidget {
  const TestimonialsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TestimonialsController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              breadcrumbsItems: ['Testimonials'],
              heading: 'Testimonials',
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
                    buttonText: 'Create Testimonial',
                    onPressed: () => Get.toNamed(AdminRoutes.createTestimonial),
                    searchController: controller.searchController,
                    onSearchChanged: (q) => controller.searchQuery(q),
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  const TestimonialsTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
