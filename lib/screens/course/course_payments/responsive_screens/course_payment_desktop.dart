import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

import '../controllers/course_payment_controller.dart';
import '../table/course_payment_table.dart';

class CoursePaymentDesktopScreen extends StatelessWidget {
  const CoursePaymentDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CoursePaymentController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              heading: "Course Payments",
              breadcrumbsItems: ["Course Payments"],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            AdminRoundedContainer(
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      label: Text("Search Payments"),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: controller.search,
                  ),
                  const Gap(AdminSizes.spaceBtwSections),
                  const CoursePaymentTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
