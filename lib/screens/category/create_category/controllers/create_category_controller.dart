import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/category/all_category/controllers/category_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';

class CreateCategoryController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var image = AdminImages.defaultImage.obs;

  final categoryController = CategoryController.instance;

  final createCategoryFormKey = GlobalKey<FormState>();
  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);

  final storageService = AdminStorageService();

  void selectCategoryImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      image.value = selectedImages.first.url;
    }
  }

  Future<void> createCategory() async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        AdminLoaders.errorSnackBar(
          title: "No Internet Connection",
          message: "Please check your internet connection and try again.",
          // message: "Something went wrong. Please try again.",
        );
        return;
      }
      // for validation
      if (!createCategoryFormKey.currentState!.validate()) {
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.categoryCreate,
        headers: {"Authorization": storageService.token!},
        body: {
          "name": nameController.text,
          "description": descriptionController.text,
          "image": image.value,
          "isFeatured": isFeatured.value,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        categoryController.fetchCategories();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Category created successfully.",
        );
      } else {}
    } catch (e) {
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again.",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
