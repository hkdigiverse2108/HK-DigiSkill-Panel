import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/legality/privacy_policy/widgets/privacy_policy_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class PrivacyPolicyDesktopScreen extends StatelessWidget {
  const PrivacyPolicyDesktopScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              heading: "Privacy Policy",
              breadcrumbsItems: ["Privacy Policy"],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            const PrivacyPolicyForm(),
          ],
        ),
      ),
    );
  }
}
