import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/responsive_screens/banners_desktop.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/responsive_screens/banners_mobile.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/responsive_screens/banners_tablet.dart';

class AllBannersScreen extends StatelessWidget {
  const AllBannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: BannersMobileScreen(),
      tablet: BannersTabletScreen(),
      desktop: BannersDesktopScreen(),
    );
  }
}
