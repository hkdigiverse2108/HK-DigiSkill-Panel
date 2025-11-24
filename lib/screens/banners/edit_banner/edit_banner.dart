import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/banner_model.dart';
import 'package:hkdigiskill_admin/screens/banners/edit_banner/responsive_screens/edit_banner_desktop.dart';
import 'package:hkdigiskill_admin/screens/banners/edit_banner/responsive_screens/edit_banner_mobile.dart';
import 'package:hkdigiskill_admin/screens/banners/edit_banner/responsive_screens/edit_banner_tablet.dart';

class EditBannerScreen extends StatelessWidget {
  const EditBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BannerModel item = Get.arguments;
    return AdminSiteLayouts(
      mobile: EditBannerMobileScreen(item: item),
      tablet: EditBannerTabletScreen(item: item),
      desktop: EditBannerDesktopScreen(item: item),
    );
  }
}
