import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class WorkshopThumbnailImage extends StatelessWidget {
  const WorkshopThumbnailImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminRoundedContainer(
      child: Column(
        children: [
          Text(
            "Workshop Thumbnail",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Gap(AdminSizes.spaceBtwItems),

          AdminRoundedContainer(
            height: 300,
            backgroundColor: AdminColors.primaryBackground,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AdminRoundedImage(
                          imageType: ImageType.asset,
                          width: 220,
                          height: 220,
                          image: AdminImages.defaultImage,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    width: 200,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AdminColors.primaryBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AdminSizes.borderRadiusMd,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Add Thumbnail"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
