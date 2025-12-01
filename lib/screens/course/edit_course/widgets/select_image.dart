import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/controllers/edit_course_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class EditSelectImage extends StatelessWidget {
  const EditSelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EditCourseController.instance;
    return AdminRoundedContainer(
      child: Column(
        children: [
          Text("Course Image", style: Theme.of(context).textTheme.titleMedium),
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
                            imageType: controller.image.value.isEmpty
                                ? ImageType.asset
                                : ImageType.network,
                            width: 220,
                            height: 220,
                            image: controller.image.value.isEmpty
                                ? AdminImages.defaultImage
                                : controller.image.value,
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
                controller.selectImage();
              },
              child: const Text("Select Image"),
            ),
          ),
        ],
      ),
    );
  }
}
