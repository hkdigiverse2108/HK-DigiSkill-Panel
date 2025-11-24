import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/screens/testimonials/edit_testimonial/controllers/edit_testimonial_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class EditTestimonialForm extends GetView<EditTestimonialController> {
  const EditTestimonialForm({super.key, required this.item});

  final TestimonialModel item;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: EditTestimonialController(),
      initState: (state) {
        controller.initItem(item);
      },
      builder: (controller) {
        return AdminRoundedContainer(
          width: 700,
          padding: EdgeInsets.all(AdminSizes.defaultSpace),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Testimonial',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: AdminSizes.spaceBtwSections),
                TextFormField(
                  controller: controller.nameController,
                  validator: (v) => AdminValidators.validateEmptyText('Name', v),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.designationController,
                  validator: (v) => AdminValidators.validateEmptyText('Designation', v),
                  decoration: const InputDecoration(
                    labelText: 'Designation',
                    prefixIcon: Icon(Iconsax.briefcase),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),
                TextFormField(
                  controller: controller.descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description (optional)',
                    prefixIcon: Icon(Iconsax.document_text),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Text('Rate'),
                    SizedBox(width: AdminSizes.spaceBtwItems),
                    Obx(
                      () => DropdownButton<int>(
                        value: controller.rate.value,
                        items: List.generate(
                          5,
                          (i) => DropdownMenuItem(
                            value: i + 1,
                            child: Text('${i + 1}'),
                          ),
                        ),
                        onChanged: (val) {
                          if (val != null) controller.rate.value = val;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),
                Obx(
                  () => AdminImageUploader(
                    width: 80,
                    height: 80,
                    image: controller.pickedImagePath.value.isEmpty
                        ? AdminImages.defaultImage
                        : controller.pickedImagePath.value,
                    imageType: controller.pickedImagePath.value.isEmpty
                        ? ImageType.asset
                        : controller.imageType.value,
                    onIconButtonPressed: controller.onIconButtonPressed,
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields),
                Obx(
                  () => CheckboxMenuButton(
                    value: controller.isFeatured.value,
                    onChanged: (value) {
                      controller.isFeatured.value = value ?? false;
                    },
                    child: const Text('Featured'),
                  ),
                ),
                SizedBox(height: AdminSizes.spaceBtwInputFields * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.updateItem(item),
                    child: const Text('Update'),
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
