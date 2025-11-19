import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/responsive_screens/workshop_desktop.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/responsive_screens/workshop_mobile.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/responsive_screens/workshop_tablet.dart';

class AllWorkshopScreen extends StatelessWidget {
  const AllWorkshopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: WorkshopMobileScreen(),
      tablet: WorkshopTabletScreen(),
      desktop: WorkshopDesktopScreen(),
    );
  }
}
