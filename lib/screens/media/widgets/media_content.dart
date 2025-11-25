import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loader_animation.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/screens/media/widgets/folder_dropdown.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class MediaContent extends StatelessWidget {
  MediaContent({
    super.key,
    required this.allowSelection,
    required this.allowMultipleSelection,
    this.alreadySelectedUrls,
    this.onImagesSelected,
  });

  final bool allowSelection;
  final bool allowMultipleSelection;
  final List<String>? alreadySelectedUrls;
  final List<ImageModel> selectedImages = [];
  final Function(List<ImageModel> selectedImages)? onImagesSelected;

  @override
  Widget build(BuildContext context) {
    bool loadedPreviousSection = false;
    final controller = MediaController.instance;
    return AdminRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media Content Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Image Folders",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Gap(AdminSizes.spaceBtwItems),
                  MediaFolderDropdown(
                    onChanged: (MediaCategory? newValue) {
                      if (newValue != null) {
                        controller.selectedCategory.value = newValue;
                        if (controller.selectedCategory.value !=
                            MediaCategory.folders) {
                          controller.getMediaImages();
                        }
                      }
                    },
                  ),
                ],
              ),

              if (allowSelection) buildAddSelectedImagesButton(),
            ],
          ),
          Gap(AdminSizes.spaceBtwSections),

          /// Media Content
          Obx(() {
            List<ImageModel> images = _getSelectedFolderImages(controller);

            if (!loadedPreviousSection) {
              if (alreadySelectedUrls != null &&
                  alreadySelectedUrls!.isNotEmpty) {
                final selectedUrlsSet = Set<String>.from(alreadySelectedUrls!);

                for (var image in images) {
                  image.isSelected.value = selectedUrlsSet.contains(image.url);
                  if (image.isSelected.value) {
                    selectedImages.add(image);
                  }
                }
              } else {
                for (var image in images) {
                  image.isSelected.value = false;
                }
              }
              loadedPreviousSection = true;
            }
            // loading animation
            if (controller.isLoading.value && images.isEmpty) {
              return AdminLoadersAnimation();
            }

            // empty state
            if (images.isEmpty) {
              return _buildEmptyState(context);
            }

            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: AdminSizes.spaceBtwItems / 2,
                    runSpacing: AdminSizes.spaceBtwItems / 2,
                    children: images
                        .map(
                          (image) => InkWell(
                            onTap: () {
                              log(image.url);
                            },
                            child: SizedBox(
                              width: 140,
                              height: 160,
                              child: Column(
                                children: [
                                  allowSelection
                                      ? _buildListWithCheckbox(image)
                                      : _buildSimpleList(image),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AdminSizes.sm,
                                      ),
                                      child: Text(
                                        image.filename,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),

                /// Load More Media Button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: AdminSizes.spaceBtwSections,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AdminSizes.buttonWidth * 1.2,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: const Text('Load More'),
                          icon: const Icon(Iconsax.arrow_down),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget buildAddSelectedImagesButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Close Button
        SizedBox(
          width: 120,
          child: OutlinedButton.icon(
            label: const Text('Close'),
            icon: const Icon(Iconsax.close_circle),
            onPressed: () => Get.back(),
          ),
        ),
        const SizedBox(width: AdminSizes.spaceBtwItems),
        SizedBox(
          width: 120,
          child: ElevatedButton.icon(
            label: const Text('Add'),
            icon: const Icon(Iconsax.image),
            onPressed: () => Get.back(result: selectedImages),
          ),
        ),
      ],
    );
  }

  List<ImageModel> _getSelectedFolderImages(MediaController controller) {
    List<ImageModel> images = [];
    switch (controller.selectedCategory.value) {
      case MediaCategory.folders:
        images = controller.allImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
      case MediaCategory.banner:
        images = controller.allBannerImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
      case MediaCategory.blog:
        images = controller.allBlogImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
      case MediaCategory.category:
        images = controller.allCategoryImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
      case MediaCategory.workshop:
        images = controller.allWorkshopImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
      case MediaCategory.partner:
        images = controller.allPartnerImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
      case MediaCategory.course:
        images = controller.allCourseImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
      case MediaCategory.gallery:
        images = controller.allGalleryImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
      case MediaCategory.curriculum:
        images = controller.allCurriculumImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
      case MediaCategory.instructors:
        images = controller.allInstructorsImages
            .where((element) => element.url.isNotEmpty)
            .toList();
        break;
    }
    return images;
  }

  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AdminSizes.lg * 3),
      child: AdminAnimationLoaderWidget(
        text: "Select a folder to view images",
        animation: AdminImages.emptyAnimation,
        height: 300,
        width: 300,
      ),
    );
  }

  Widget _buildSimpleList(ImageModel image) {
    return AdminRoundedImage(
      width: 140,
      height: 120,
      imageType: ImageType.network,
      padding: AdminSizes.sm,
      image: image.url,
      margin: AdminSizes.spaceBtwItems / 2,
      backgroundColor: AdminColors.primaryBackground,
    );
  }

  Widget _buildListWithCheckbox(ImageModel image) {
    return Stack(
      children: [
        AdminRoundedImage(
          width: 140,
          height: 140,
          imageType: ImageType.network,
          padding: AdminSizes.sm,
          image: image.url,
          margin: AdminSizes.spaceBtwItems / 2,
          backgroundColor: AdminColors.primaryBackground,
        ),
        Positioned(
          top: AdminSizes.md,
          right: AdminSizes.md,
          child: Obx(
            () => Checkbox(
              value: image.isSelected.value,
              onChanged: (selected) {
                if (selected != null) {
                  image.isSelected.value = selected;

                  if (selected) {
                    if (!allowMultipleSelection) {
                      for (var element in selectedImages) {
                        if (element != image) {
                          element.isSelected.value = false;
                        }
                      }
                      selectedImages.clear();
                    }
                    selectedImages.add(image);
                  } else {
                    selectedImages.remove(image);
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
