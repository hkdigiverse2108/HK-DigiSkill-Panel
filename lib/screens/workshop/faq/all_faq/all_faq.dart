import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/all_faq/responsive_screens/faq_desktop.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/all_faq/responsive_screens/faq_mobile.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/all_faq/responsive_screens/faq_tablet.dart';

class WorkshopAllFaqScreen extends StatelessWidget {
  const WorkshopAllFaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: WorkshopFaqMobileScreen(),
      tablet: WorkshopFaqTabletScreen(),
      desktop: WorkshopFaqDesktopScreen(),
    );
  }
}
