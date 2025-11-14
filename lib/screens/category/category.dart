import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/category/responsive_screens/category_desktop.dart';
import 'package:hkdigiskill_admin/screens/category/responsive_screens/category_mobile.dart';
import 'package:hkdigiskill_admin/screens/category/responsive_screens/category_tablet.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      mobile: CategoryMobileScreen(),
      tablet: CategoryTabletScreen(),
      desktop: CategoryDesktopScreen(),
    );
  }
}
