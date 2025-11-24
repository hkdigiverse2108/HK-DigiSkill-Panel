import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/data/models/gallery_model.dart';
import 'package:hkdigiskill_admin/screens/gallery/edit_gallery/responsive_screens/edit_gallery_desktop.dart';
import 'package:hkdigiskill_admin/screens/gallery/edit_gallery/responsive_screens/edit_gallery_mobile.dart';
import 'package:hkdigiskill_admin/screens/gallery/edit_gallery/responsive_screens/edit_gallery_tablet.dart';

class EditGalleryScreen extends StatelessWidget {
  const EditGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GalleryModel item = Get.arguments;
    return AdminSiteLayouts(
      mobile: EditGalleryMobileScreen(item: item),
      tablet: EditGalleryTabletScreen(item: item),
      desktop: EditGalleryDesktopScreen(item: item),
    );
  }
}
