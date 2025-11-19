import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/category/create_category/responsive_screens/create_category_desktop.dart';
import 'package:hkdigiskill_admin/screens/category/create_category/responsive_screens/create_category_mobile.dart';
import 'package:hkdigiskill_admin/screens/category/create_category/responsive_screens/create_category_tablet.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CreateCategoryMobileScreen(),
      tablet: CreateCategoryTabletScreen(),
      desktop: CreateCategoryDesktopScreen(),
    );
  }
}
