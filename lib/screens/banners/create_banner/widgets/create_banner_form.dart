import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/image_uploader.dart';
import 'package:hkdigiskill_admin/data/models/banner_model.dart';
import 'package:hkdigiskill_admin/screens/banners/create_banner/controllers/create_banner_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class CreateBannerForm extends GetView<CreateBannerController> {
  const CreateBannerForm({super.key});

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
              'Create Banner',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: AdminSizes.spaceBtwSections),

            // Type selector
            Obx(
              () => DropdownButtonFormField<BannerType>(
                value: controller.type.value,
                decoration: const InputDecoration(
                  labelText: 'Type',
                  prefixIcon: Icon(Iconsax.category),
                ),
                items: const [
                  DropdownMenuItem(value: BannerType.web, child: Text('Web')),
                  DropdownMenuItem(value: BannerType.app, child: Text('App')),
                ],
                onChanged: (val) {
                  if (val != null) controller.type.value = val;
                },
              ),
            ),
            SizedBox(height: AdminSizes.spaceBtwInputFields),

            // Web fields
            Obx(() {
              if (controller.type.value == BannerType.web) {
                return Column(
                  children: [
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Primary Image'),
                          SizedBox(height: AdminSizes.spaceBtwItems),
                          Obx(
                            () => AdminImageUploader(
                              width: 100,
                              height: 100,
                              image: controller.imagePrimary.value.isEmpty
                                  ? AdminImages.defaultImage
                                  : controller.imagePrimary.value,
                              imageType: controller.imagePrimary.value.isEmpty
                                  ? ImageType.asset
                                  : ImageType.network,
                              onIconButtonPressed: controller.onPickPrimary,
                            ),
                          ),
                          SizedBox(height: AdminSizes.spaceBtwInputFields),
                          Text('Secondary Image'),
                          SizedBox(height: AdminSizes.spaceBtwItems),
                          Obx(
                            () => AdminImageUploader(
                              width: 100,
                              height: 100,
                              image: controller.imageSecondary.value.isEmpty
                                  ? AdminImages.defaultImage
                                  : controller.imageSecondary.value,
                              imageType: controller.imageSecondary.value.isEmpty
                                  ? ImageType.asset
                                  : ImageType.network,
                              onIconButtonPressed: controller.onPickSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),

            // App fields
            Obx(() {
              if (controller.type.value == BannerType.app) {
                return Column(
                  children: [
                    TextFormField(
                      controller: controller.linkController,
                      validator: (v) => AdminValidators.validateEmptyText('Link', v),
                      decoration: const InputDecoration(
                        labelText: 'Link',
                        prefixIcon: Icon(Iconsax.link),
                      ),
                    ),
                    SizedBox(height: AdminSizes.spaceBtwInputFields),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Image'),
                          SizedBox(height: AdminSizes.spaceBtwItems),
                          Obx(
                            () => AdminImageUploader(
                              width: 100,
                              height: 100,
                              image: controller.imagePrimary.value.isEmpty
                                  ? AdminImages.defaultImage
                                  : controller.imagePrimary.value,
                              imageType: controller.imagePrimary.value.isEmpty
                                  ? ImageType.asset
                                  : ImageType.network,
                              onIconButtonPressed: controller.onPickPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),

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
