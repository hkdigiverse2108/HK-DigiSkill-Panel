import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/category/edit_category/responsive_screens/edit_category_desktop.dart';
import 'package:hkdigiskill_admin/screens/category/edit_category/responsive_screens/edit_category_mobile.dart';
import 'package:hkdigiskill_admin/screens/category/edit_category/responsive_screens/edit_category_tablet.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Get.arguments;
    return AdminSiteLayouts(
      mobile: EditCategoryMobileScreen(category: category),
      tablet: EditCategoryTabletScreen(category: category),
      desktop: EditCategoryDesktopScreen(category: category),
    );
  }
}
