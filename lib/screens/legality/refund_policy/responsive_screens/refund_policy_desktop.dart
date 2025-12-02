import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/legality/refund_policy/widgets/refund_policy_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class RefundPolicyDesktopScreen extends StatelessWidget {
  const RefundPolicyDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      desktop: _DesktopBody(),
      tablet: _DesktopBody(),
      mobile: _DesktopBody(),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          children: [
            const AdminBreadcrumbWithHeading(
              heading: "Refund Policy",
              breadcrumbsItems: ["Refund Policy"],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            const RefundPolicyForm(),
          ],
        ),
      ),
    );
  }
}
