import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';

import 'responsive_screens/dashboard_desktop.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      desktop: DashboardScreenDesktop(),
      // mobile: , tablet: ,
    );
  }
}
