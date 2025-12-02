import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/models/workshop_model.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class WorkshopCreateTestimonialController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;
  var rate = 5.obs; // 1-5
  var workshopController = WorkshopController.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final testimonialsController = WorkshopTestimonialsController.instance;

  final createTestimonialFormKey = GlobalKey<FormState>();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  var pickedImagePath = ''.obs;
  var imageType = ImageType.asset.obs;

  var selectedWorkshopId = ''.obs;
  var selectedWorkshopName = ''.obs;
  var workshopList = <WorkshopModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    setWorkshopList();
  }

  void setWorkshopList() {
    workshopList.value = workshopController.dataList;
  }

  void selectWorkshop(String title) {
    final workshop = workshopList.firstWhere((w) => w.title == title);
    selectedWorkshopId.value = workshop.id;
    selectedWorkshopName.value = workshop.title;
  }

  Future<void> onIconButtonPressed() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      pickedImagePath.value = selectedImages.first.url;
    }
  }

  Future<void> createItem() async {
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
      if (!createTestimonialFormKey.currentState!.validate()) {
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.testimonialsCreate,
        headers: {"authorization": storageService.token!},
        body: {
          "name": nameController.text,
          "designation": designationController.text,
          "description": descriptionController.text,
          "rate": rate.value,
          "isFeatured": isFeatured.value,
          "image": pickedImagePath.value,
          "type": DashType.workshop.name,
          "learningCatalogId": selectedWorkshopId.value,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        testimonialsController.fetchTestimonials();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Testimonial created successfully.",
        );
      } else {
        AdminLoaders.errorSnackBar(
          title: "Error",
          message: "Something went wrong. Please try again.",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: "Something went wrong. Please try again.",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
