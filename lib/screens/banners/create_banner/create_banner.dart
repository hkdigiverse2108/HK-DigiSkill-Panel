import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/banners/create_banner/responsive_screens/create_banner_desktop.dart';
import 'package:hkdigiskill_admin/screens/banners/create_banner/responsive_screens/create_banner_mobile.dart';
import 'package:hkdigiskill_admin/screens/banners/create_banner/responsive_screens/create_banner_tablet.dart';

class CreateBannerScreen extends StatelessWidget {
  const CreateBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CreateBannerMobileScreen(),
      tablet: CreateBannerTabletScreen(),
      desktop: CreateBannerDesktopScreen(),
    );
  }
}
