import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/screens/media/widgets/media_content.dart';
import 'package:hkdigiskill_admin/screens/media/widgets/media_uploader.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:iconsax/iconsax.dart';

class MediaMobileScreen extends StatelessWidget {
  const MediaMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // heading and breadcrumbs
            LayoutBuilder(
              builder: (context, constraints) =>
                  AdminHelperFunctions.isWidthValid(400)
                  ? Column(
                      children: [
                        const AdminBreadcrumbWithHeading(
                          heading: 'Media',
                          breadcrumbsItems: ['Media Screen'],
                        ),
                        const Gap(AdminSizes.spaceBtwItems),

                        SizedBox(
                          width: AdminSizes.buttonWidth * 1.3,
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                controller.showImagesUploaderSection.value =
                                    !controller.showImagesUploaderSection.value,
                            icon: const Icon(Iconsax.cloud_add),
                            label: const Text(
                              "Upload Image",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // breadcrumbs
                        const AdminBreadcrumbWithHeading(
                          heading: 'Media',
                          breadcrumbsItems: ['Media Screen'],
                        ),

                        SizedBox(
                          width: AdminSizes.buttonWidth * 1.3,
                          child: ElevatedButton.icon(
                            onPressed: () =>
                                controller.showImagesUploaderSection.value =
                                    !controller.showImagesUploaderSection.value,
                            icon: const Icon(Iconsax.cloud_add),
                            label: const Text(
                              "Upload Image",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            const Gap(AdminSizes.spaceBtwItems),

            /// Upload Area
            const MediaUploader(),

            /// Media
            MediaContent(allowSelection: false, allowMultipleSelection: false),
          ],
        ),
      ),
    );
  }
}
