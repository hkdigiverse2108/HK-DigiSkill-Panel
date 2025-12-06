import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/create_curriculum/controllers/create_course_curriculum_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class PdfSelection extends StatelessWidget {
  const PdfSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateCourseCurriculumController.instance;
    return AdminRoundedContainer(
      child: Column(
        children: [
          Text("Attachment", style: Theme.of(context).textTheme.titleMedium),
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
                            imageType: controller.attachment.value.isEmpty
                                ? ImageType.asset
                                : ImageType.asset,
                            width: 220,
                            height: 220,
                            image: controller.attachment.value.isEmpty
                                ? AdminImages.defaultImage
                                : AdminImages.pdfIcon,
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
                controller.selectPdfFile();
              },
              child: const Text("Select PDF"),
            ),
          ),
        ],
      ),
    );
  }
}
