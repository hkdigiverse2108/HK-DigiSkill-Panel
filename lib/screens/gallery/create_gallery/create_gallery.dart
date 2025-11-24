import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/gallery/create_gallery/responsive_screens/create_gallery_desktop.dart';
import 'package:hkdigiskill_admin/screens/gallery/create_gallery/responsive_screens/create_gallery_mobile.dart';

class CreateGalleryScreen extends StatelessWidget {
  const CreateGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CreateGalleryMobileScreen(),
      desktop: CreateGalleryDesktopScreen(),
    );
  }
}
