import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/screens/gallery/create_gallery/controllers/create_gallery_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class CreateGalleryForm extends GetView<CreateGalleryController> {
  const CreateGalleryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminRoundedContainer(
      width: 700,
      padding: EdgeInsets.all(AdminSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Gallery',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: AdminSizes.spaceBtwSections),
            TextFormField(
              controller: controller.titleController,
              validator: (v) => AdminValidators.validateEmptyText('Title', v),
              decoration: const InputDecoration(
                labelText: 'Title',
                prefixIcon: Icon(Iconsax.text),
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
                SizedBox(
                  width: 180, // or any fixed width that works for your layout
                  child: ElevatedButton.icon(
                    onPressed: controller.onPickImages,
                    icon: const Icon(Iconsax.image),
                    label: const Text('Add Images'),
                  ),
                ),
                const SizedBox(width: 12),
                Obx(() => Text('Selected: ${controller.images.length}')),
              ],
            ),
            SizedBox(height: AdminSizes.spaceBtwItems),
            Obx(
              () => Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (int i = 0; i < controller.images.length; i++)
                    Stack(
                      children: [
                        AdminImageUploader(
                          width: 90,
                          height: 90,
                          image: controller.images[i].isEmpty
                              ? AdminImages.defaultImage
                              : controller.images[i],
                          imageType: controller.images[i].isEmpty
                              ? ImageType.asset
                              : ImageType.network,
                          onIconButtonPressed: () =>
                              controller.onRemoveImageAt(i),
                          icon: Iconsax.trash,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(height: AdminSizes.spaceBtwInputFields * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.createItem,
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
