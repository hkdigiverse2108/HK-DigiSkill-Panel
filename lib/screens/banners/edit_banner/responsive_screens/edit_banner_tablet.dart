import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/banner_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/banners/edit_banner/widgets/edit_banner_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class EditBannerTabletScreen extends StatelessWidget {
  const EditBannerTabletScreen({super.key, required this.item});

  final BannerModel item;

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
              breadcrumbsItems: [AdminRoutes.banners, 'Banners'],
              heading: 'Edit Banner',
            ),
            const Gap(AdminSizes.spaceBtwSections),
            EditBannerForm(item: item),
          ],
        ),
      ),
    );
  }
}
