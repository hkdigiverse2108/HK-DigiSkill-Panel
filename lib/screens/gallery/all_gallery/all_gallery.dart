import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/responsive_screens/gallery_desktop.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/responsive_screens/gallery_mobile.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/responsive_screens/gallery_tablet.dart';

class AllGalleryScreen extends StatelessWidget {
  const AllGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: GalleryMobileScreen(),
      tablet: GalleryTabletScreen(),
      desktop: GalleryDesktopScreen(),
    );
  }
}
