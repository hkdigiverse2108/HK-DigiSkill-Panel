import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/screens/dashboard/widgets/dashboard_card.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class DashboardScreenMobile extends StatelessWidget {
  const DashboardScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading
            Text("Dashboard", style: Theme.of(context).textTheme.headlineSmall),
            const Gap(AdminSizes.spaceBtwSections),

            // cards
            AdminDashboardCard(title: "Students", subtitle: "1000", stats: 10),
            const Gap(AdminSizes.spaceBtwItems),
            AdminDashboardCard(title: "Courses", subtitle: "100", stats: 10),
            const Gap(AdminSizes.spaceBtwItems),
            AdminDashboardCard(title: "Workshops", subtitle: "10", stats: 20),
            const Gap(AdminSizes.spaceBtwItems),
            AdminDashboardCard(
              title: "Buy Courses",
              subtitle: "1800",
              stats: 20,
            ),
          ],
        ),
      ),
    );
  }
}
