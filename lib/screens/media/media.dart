import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/media/responsive_screens/media_desktop.dart';
import 'package:hkdigiskill_admin/screens/media/responsive_screens/media_mobile.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      desktop: MediaDesktopScreen(),
      mobile: MediaMobileScreen(),
    );
  }
}
