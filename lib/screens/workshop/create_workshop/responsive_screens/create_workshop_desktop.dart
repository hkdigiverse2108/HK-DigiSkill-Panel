import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/widgets/title_description.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/widgets/workshop_thumbnail_image.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';

class CreateWorkshopDesktopScreen extends StatelessWidget {
  const CreateWorkshopDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const WorkshopBottomNavigationButtons(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumb
            AdminBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              heading: 'Create Workshop',
              breadcrumbsItems: [AdminRoutes.wWorkshops, 'Create Workshop'],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: AdminDeviceUtility.isTabletScreen(context) ? 2 : 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Basic Information
                      const WorkshopTitleAndDescription(),
                      const Gap(AdminSizes.defaultSpace),

                      // Additional Information
                      Container(),
                    ],
                  ),
                ),
                Gap(AdminSizes.defaultSpace),
                Expanded(child: Column(children: [WorkshopThumbnailImage()])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
