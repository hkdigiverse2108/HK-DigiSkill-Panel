import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/legality/about_us/controllers/about_us_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class AboutUsForm extends GetView<AboutUsController> {
  const AboutUsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: AdminAnimationLoaderWidget(
            text: 'Loading Instructors',
            animation: AdminImages.loadingAnimation,
            height: 200,
            width: 200,
          ),
        );
      }

      return AdminRoundedContainer(
        padding: const EdgeInsets.all(AdminSizes.defaultSpace),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Us",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),

              /// Content Editor
              TextFormField(
                controller: controller.contentController,
                maxLines: 15,
                decoration: const InputDecoration(
                  labelText: "Content",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.updateData,
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text("Update"),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
