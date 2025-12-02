import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/data/models/instructor_model.dart';
import 'package:hkdigiskill_admin/screens/instructors/edit_instructor/controllers/edit_instructor_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EditInstructorForm extends GetView<EditInstructorController> {
  final InstructorModel instructor;

  const EditInstructorForm({super.key, required this.instructor});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditInstructorController(),
      initState: (_) => controller.initFields(instructor),
      builder: (controller) {
        return AdminRoundedContainer(
          width: 700,
          padding: const EdgeInsets.all(AdminSizes.defaultSpace),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit Instructor",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AdminSizes.spaceBtwSections),

                /// Name
                TextFormField(
                  controller: controller.nameController,
                  validator: (v) =>
                      AdminValidators.validateEmptyText("Name", v),
                  decoration: const InputDecoration(
                    labelText: "Name",
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                const SizedBox(height: AdminSizes.spaceBtwInputFields),

                /// Designation
                TextFormField(
                  controller: controller.designationController,
                  decoration: const InputDecoration(
                    labelText: "Designation (optional)",
                    prefixIcon: Icon(Iconsax.briefcase),
                  ),
                ),
                const SizedBox(height: AdminSizes.spaceBtwInputFields),

                /// Image
                const Text(
                  "Profile Image",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: AdminSizes.sm),

                Obx(
                  () => AdminImageUploader(
                    width: double.infinity,
                    height: 200,
                    image: controller.image.value.isEmpty
                        ? AdminImages.defaultImage
                        : controller.image.value,
                    imageType: controller.image.value.isEmpty
                        ? ImageType.asset
                        : ImageType.network,
                    onIconButtonPressed: controller.selectImage,
                  ),
                ),

                const SizedBox(height: AdminSizes.spaceBtwSections),

                /// Social Links
                TextFormField(
                  controller: controller.linkedinController,
                  decoration: const InputDecoration(
                    labelText: "LinkedIn (optional)",
                    prefixIcon: Icon(Iconsax.link),
                  ),
                ),
                const SizedBox(height: AdminSizes.spaceBtwInputFields),

                TextFormField(
                  controller: controller.instagramController,
                  decoration: const InputDecoration(
                    labelText: "Instagram (optional)",
                    prefixIcon: Icon(Iconsax.instagram),
                  ),
                ),
                const SizedBox(height: AdminSizes.spaceBtwInputFields),

                TextFormField(
                  controller: controller.facebookController,
                  decoration: const InputDecoration(
                    labelText: "Facebook (optional)",
                    prefixIcon: Icon(Icons.facebook),
                  ),
                ),
                const SizedBox(height: AdminSizes.spaceBtwInputFields),

                TextFormField(
                  controller: controller.twitterController,
                  decoration: const InputDecoration(
                    labelText: "Twitter (optional)",
                    prefixIcon: Icon(PhosphorIconsBold.twitterLogo),
                  ),
                ),
                const SizedBox(height: AdminSizes.spaceBtwSections * 2),

                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () => controller.updateInstructor(instructor),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text("Update Instructor"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
