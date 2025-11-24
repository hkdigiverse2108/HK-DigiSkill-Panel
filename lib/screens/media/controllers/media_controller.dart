import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/dialogs/confirm_dialog.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/screens/media/widgets/media_content.dart';
import 'package:hkdigiskill_admin/screens/media/widgets/media_uploader.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/popups/full_screen_loader.dart';
import 'package:iconsax/iconsax.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  final RxBool isLoading = false.obs;

  final int initialImagesCount = 20;
  final int loadMoreCount = 25;
  late DropzoneViewController dropzoneController;
  final RxBool showImagesUploaderSection = false.obs;
  final Rx<MediaCategory> selectedCategory = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImagesToUpload = <ImageModel>[].obs;

  final RxList<ImageModel> allImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBannerImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBlogImages = <ImageModel>[].obs;
  final RxList<ImageModel> allCategoryImages = <ImageModel>[].obs;
  final RxList<ImageModel> allWorkshopImages = <ImageModel>[].obs;
  final RxList<ImageModel> allPartnerImages = <ImageModel>[].obs;

  void getMediaImages() async {
    try {
      isLoading.value = true;
      RxList<ImageModel> targetedList = <ImageModel>[].obs;
      switch (selectedCategory.value) {
        case MediaCategory.folders:
          targetedList = allImages;
          break;
        case MediaCategory.banner:
          targetedList = allBannerImages;
          break;
        case MediaCategory.blog:
          targetedList = allBlogImages;
          break;
        case MediaCategory.category:
          targetedList = allCategoryImages;
          break;
        case MediaCategory.workshop:
          targetedList = allWorkshopImages;
          break;
        case MediaCategory.partner:
          targetedList = allPartnerImages;
          break;
      }

      // load more
      // final images = await
      // targetedList.addAll(images);
    } catch (e) {
      AdminLoaders.errorSnackBar(
        title: 'Error',
        message: "Failed to get media images: $e",
      );
    } finally {
      isLoading.value = false;
    }
  }

  // load more
  void loadMoreImages() async {}

  Future<void> selectLocalImages() async {
    final files = await dropzoneController.pickFiles(
      multiple: true,
      mime: ['image/jpeg', 'image/png'],
    );

    if (files.isNotEmpty) {
      for (final file in files) {
        final bytes = await dropzoneController.getFileData(file);
        final image = ImageModel(
          url: '',
          filename: file.name,
          file: file,
          folder: '',
          localImageToDisplay: Uint8List.fromList(bytes),
        );
        selectedImagesToUpload.add(image);
      }
    }
  }

  void uploadImagesConfirmation() async {
    if (selectedCategory.value == MediaCategory.folders) {
      AdminLoaders.warningSnackBar(
        title: 'Select Folder',
        message: "Please select a folder in order to upload images",
      );
      return;
    }

    ConfirmDialog.show(
      title: "Upload Images",
      message:
          "Are you sure you want to upload all this images to ${selectedCategory.value.name.toUpperCase()} folder?",
      icon: Iconsax.cloud_add,
      iconColor: AdminColors.primary,
      confirmText: "Upload",
      onConfirm: () async => uploadImages(),
    );
  }

  Future<void> uploadImages() async {
    try {
      uploadImagesLoader();
      await Future.delayed(const Duration(seconds: 5));
      AdminLoaders.successSnackBar(
        title: 'Upload Success',
        message: "Images uploaded successfully",
      );
      selectedImagesToUpload.clear();
    } catch (e) {
      AdminLoaders.errorSnackBar(
        title: 'Upload Error',
        message: "Failed to upload images: $e",
      );
    } finally {
      AdminFullScreenLoader.stopLoading();
    }
  }

  void uploadImagesLoader() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: const Text("Uploading Images"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AdminImages.imageUploadGif, height: 300, width: 300),
              const Gap(AdminSizes.spaceBtwItems),
              const Text("Sit Tight! Your images are Uploading..."),
            ],
          ),
        ),
      ),
    );
  }

  // Image Selection Bottom Sheet
  Future<List<ImageModel>?> selectImagesFromMedia({
    List<String>? selectedUrls,
    bool allowSelection = true,
    bool allowMultipleSelection = false,
  }) async {
    showImagesUploaderSection.value = true;

    List<ImageModel>? selectedImages = await Get.bottomSheet<List<ImageModel>>(
      isScrollControlled: true,
      backgroundColor: AdminColors.primaryBackground,
      FractionallySizedBox(
        heightFactor: 1,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AdminSizes.defaultSpace),
          child: Column(
            children: [
              const MediaUploader(),
              MediaContent(
                allowSelection: allowSelection,
                allowMultipleSelection: allowMultipleSelection,
                alreadySelectedUrls: selectedUrls ?? [],
              ),
            ],
          ),
        ),
      ),
    );

    return selectedImages;
  }
}
