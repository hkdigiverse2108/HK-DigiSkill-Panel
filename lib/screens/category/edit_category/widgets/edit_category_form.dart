import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/data/models/category_model.dart';
import 'package:hkdigiskill_admin/screens/category/edit_category/controllers/edit_category_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class EditCategoryForm extends GetView<EditCategoryController> {
  const EditCategoryForm({super.key, required this.category});

  final CourseCategoryDatum category;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditCategoryController(),
      initState: (state) {
        controller.initCategory(category);
      },
      builder: (controller) {
        return AdminRoundedContainer(
          width: 500,
          padding: EdgeInsets.all(AdminSizes.defaultSpace),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Heading
                Gap(AdminSizes.sm),
                Text(
                  "Update Category",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Gap(AdminSizes.spaceBtwSections),
                TextFormField(
                  controller: controller.nameController,
                  validator: (value) =>
                      AdminValidators.validateEmptyText("Name", value),
                  decoration: InputDecoration(
                    labelText: "Category Name",
                    prefixIcon: Icon(Iconsax.category),
                  ),
                ),
                Gap(AdminSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.descriptionController,
                  decoration: InputDecoration(
                    labelText: "Category Description",
                    prefixIcon: Icon(Iconsax.document),
                  ),
                  maxLines: 3,
                ),
                Gap(AdminSizes.spaceBtwInputFields * 2),
                Obx(
                  () => AdminImageUploader(
                    width: 80,
                    height: 80,
                    image: controller.pickedImagePath.value,
                    imageType: controller.imageType.value,
                    onIconButtonPressed: controller.onIconButtonPressed,
                  ),
                ),
                Gap(AdminSizes.spaceBtwInputFields),
                Obx(
                  () => CheckboxMenuButton(
                    value: controller.isFeatured.value,
                    onChanged: (value) {
                      controller.isFeatured.value = value ?? false;
                    },
                    child: const Text("Featured"),
                  ),
                ),
                Gap(AdminSizes.spaceBtwInputFields * 2),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () {
                              controller.updateCategory(category);
                            },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Text("Update"),
                    ),
                  ),
                ),
                Gap(AdminSizes.spaceBtwInputFields * 2),
              ],
            ),
          ),
        );
      },
    );
  }
}
