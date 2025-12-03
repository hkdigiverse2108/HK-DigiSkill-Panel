import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

import '../controllers/workshop_payment_controller.dart';
import '../table/workshop_payment_table.dart';

class WorkshopPaymentDesktopScreen extends StatelessWidget {
  const WorkshopPaymentDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WorkshopPaymentController.instance;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              heading: "Workshop Payments",
              breadcrumbsItems: ["Workshop Payments"],
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
                  const WorkshopPaymentTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
