import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/create_curriculum/controllers/create_workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class VideoThumbnailImage extends StatelessWidget {
  const VideoThumbnailImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateWorkshopCurriculumController.instance;
    return AdminRoundedContainer(
      child: Column(
        children: [
          Text(
            "Video Thumbnail",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Gap(AdminSizes.spaceBtwItems),

          Obx(
            () => AdminRoundedContainer(
              height: 270,
              backgroundColor: AdminColors.primaryBackground,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AdminRoundedImage(
                            imageType: controller.thumbnail.value.isEmpty
                                ? ImageType.asset
                                : ImageType.network,
                            width: 220,
                            height: 220,
                            image: controller.thumbnail.value.isEmpty
                                ? AdminImages.defaultImage
                                : controller.thumbnail.value,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Gap(AdminSizes.spaceBtwItems),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {
                controller.selectThumbnailImage();
              },
              child: const Text("Add Thumbnail"),
            ),
          ),
        ],
      ),
    );
  }
}
