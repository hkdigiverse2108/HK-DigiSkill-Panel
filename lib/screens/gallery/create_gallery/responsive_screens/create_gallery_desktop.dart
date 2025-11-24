import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/gallery/create_gallery/widgets/create_gallery_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CreateGalleryDesktopScreen extends StatelessWidget {
  const CreateGalleryDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AdminBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              breadcrumbsItems: [AdminRoutes.gallery, 'Gallery'],
              heading: 'Create Gallery',
            ),
            Gap(AdminSizes.spaceBtwSections),
            CreateGalleryForm(),
          ],
        ),
      ),
    );
  }
}
