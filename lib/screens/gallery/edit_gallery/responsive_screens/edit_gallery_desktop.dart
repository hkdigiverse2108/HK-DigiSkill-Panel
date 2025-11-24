import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/gallery_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/gallery/edit_gallery/widgets/edit_gallery_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class EditGalleryDesktopScreen extends StatelessWidget {
  const EditGalleryDesktopScreen({super.key, required this.item});

  final GalleryModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              breadcrumbsItems: [AdminRoutes.gallery, 'Gallery'],
              heading: 'Edit Gallery',
            ),
            const Gap(AdminSizes.spaceBtwSections),
            EditGalleryForm(item: item),
          ],
        ),
      ),
    );
  }
}
