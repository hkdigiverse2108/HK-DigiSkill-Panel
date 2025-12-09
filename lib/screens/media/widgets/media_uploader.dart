import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/screens/media/widgets/folder_dropdown.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => controller.showImagesUploaderSection.value
          ? Column(
              children: [
                /// Drag and drop area
                AdminRoundedContainer(
                  showBorder: true,
                  height: 250,
                  borderColor: AdminColors.borderPrimary,
                  backgroundColor: AdminColors.primaryBackground,
                  padding: EdgeInsets.all(AdminSizes.defaultSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            DropzoneView(
                              mime: const [
                                'image/jpeg',
                                'image/png',
                                'application/pdf',
                              ],
                              cursor: CursorType.Default,
                              operation: DragOperation.copy,
                              onLoaded: () => log("Zone loaded"),
                              onError: (error) => log("Zone Error: $error"),
                              onHover: () => log("Zone Hovered"),
                              onLeave: () => log("Zone Left"),
                              onCreated: (ctrl) =>
                                  controller.dropzoneController = ctrl,

                              onDropFile: (DropzoneFileInterface file) async {
                                final name = file.name.toLowerCase();
                                final isPdf = name.endsWith('.pdf');
                                final bytes = await controller
                                    .dropzoneController
                                    .getFileData(file);

                                final model = ImageModel(
                                  url: '',
                                  filename: file.name,
                                  file: file,
                                  folder: '',
                                  localImageToDisplay: isPdf
                                      ? null
                                      : Uint8List.fromList(bytes),
                                  isPdf: isPdf,
                                  contentType: isPdf
                                      ? 'application/pdf'
                                      : 'image/jpeg',
                                );

                                if (isPdf) {
                                  controller.selectedPdfsToUpload.add(model);
                                } else {
                                  controller.selectedImagesToUpload.add(model);
                                }
                                controller.update();
                              },
                              onDropInvalid: (error) =>
                                  log("Invalid file: $error"),
                              onDropFiles: (files) {
                                log("Files dropped: ${files?.length}");
                              },
                            ),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AdminImages.uploadImage,
                                  height: 50,
                                  width: 50,
                                ),
                                const Gap(AdminSizes.spaceBtwItems),
                                const Text(
                                  "Drag and drop image here or click to upload",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                const Gap(AdminSizes.spaceBtwItems),
                                OutlinedButton(
                                  onPressed: controller.selectLocalImages,
                                  child: const Text(
                                    "Select Image",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                if (controller.selectedImagesToUpload.isNotEmpty)
                  const Gap(AdminSizes.spaceBtwSections),

                /// Locally Selected images
                if (controller.selectedImagesToUpload.isNotEmpty)
                  AdminRoundedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Folders Dropdown
                            Row(
                              children: [
                                Text(
                                  "Select Folder",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                const Gap(AdminSizes.spaceBtwItems),
                                AdminHelperFunctions.isWidthValid(400)
                                    ? const SizedBox.shrink()
                                    : MediaFolderDropdown(
                                        onChanged: (MediaCategory? newValue) {
                                          if (newValue != null) {
                                            controller.selectedCategory.value =
                                                newValue;
                                          }
                                        },
                                      ),
                              ],
                            ),

                            Row(
                              children: [
                                AdminHelperFunctions.isWidthValid(470)
                                    ? const SizedBox.shrink()
                                    : TextButton(
                                        onPressed: () {
                                          controller.selectedImagesToUpload
                                              .clear();
                                          controller.selectedPdfsToUpload
                                              .clear();
                                          // No need to clear selectedImagesToDisplay as it's a computed getter
                                          // that combines the above two lists
                                          controller
                                              .update(); // Force update the UI
                                        },

                                        child: const Text(
                                          "Remove All",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),

                                const Gap(AdminSizes.spaceBtwItems),
                                AdminDeviceUtility.isMobileScreen(context)
                                    ? const SizedBox.shrink()
                                    : SizedBox(
                                        width: AdminSizes.buttonWidth,
                                        child: ElevatedButton(
                                          onPressed: controller
                                              .uploadImagesConfirmation,
                                          child: const Text("Upload"),
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(8),

                        !AdminHelperFunctions.isWidthValid(400)
                            ? const SizedBox.shrink()
                            : SizedBox(
                                width: double.infinity,
                                child: MediaFolderDropdown(
                                  onChanged: (MediaCategory? newValue) {
                                    if (newValue != null) {
                                      controller.selectedCategory.value =
                                          newValue;
                                    }
                                  },
                                ),
                              ),
                        Gap(AdminSizes.spaceBtwSections),
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: AdminSizes.spaceBtwItems / 2,
                          runSpacing: AdminSizes.spaceBtwItems / 2,
                          children: controller.selectedImagesToDisplay
                              // .where((e) => e.localImageToDisplay != null)
                              .map((e) {
                                if (e.isPdf) {
                                  return Column(
                                    children: [
                                      AdminRoundedImage(
                                        imageType: ImageType.asset,
                                        image: AdminImages.pdfIcon,
                                        height: 90,
                                        width: 90,
                                        padding: AdminSizes.sm,
                                        backgroundColor:
                                            AdminColors.primaryBackground,
                                      ),
                                    ],
                                  );
                                } else {
                                  return AdminRoundedImage(
                                    imageType: ImageType.memory,
                                    height: 90,
                                    width: 90,
                                    padding: AdminSizes.sm,
                                    memoryImage: e.localImageToDisplay,
                                    backgroundColor:
                                        AdminColors.primaryBackground,
                                  );
                                }
                              })
                              .toList(),
                        ),
                        const Gap(AdminSizes.spaceBtwSections),
                        AdminDeviceUtility.isMobileScreen(context)
                            ? SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed:
                                      controller.uploadImagesConfirmation,
                                  child: Text('Upload'),
                                ),
                              )
                            : const SizedBox.shrink(),

                        !AdminHelperFunctions.isWidthValid(470)
                            ? const SizedBox.shrink()
                            : Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      controller.selectedImagesToUpload.clear();
                                      controller.selectedPdfsToUpload.clear();
                                      // No need to clear selectedImagesToDisplay as it's a computed getter
                                      // that combines the above two lists
                                      controller
                                          .update(); // Force update the UI
                                    },

                                    child: const Text(
                                      "Remove All",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                const Gap(AdminSizes.spaceBtwSections),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
