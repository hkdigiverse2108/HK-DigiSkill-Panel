import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/instructors/all_instructors/controllers/instructor_list_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CreateInstructorController extends GetxController {
  static CreateInstructorController get instance => Get.find();

  var isLoading = false.obs;

  var image = "".obs;

  final nameController = TextEditingController();
  final designationController = TextEditingController();
  final linkedinController = TextEditingController();
  final instagramController = TextEditingController();
  final facebookController = TextEditingController();
  final twitterController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final controller = InstructorListController.instance;

  final api = ApiService(baseUrl: ApiConstants.baseUrl);
  final storage = AdminStorageService();

  /// Select Image
  void selectImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      image.value = selectedImages.first.url;
    }
  }

  Future<void> createInstructor() async {
    try {
      isLoading.value = true;

      if (!formKey.currentState!.validate()) return;

      final response = await api.post(
        path: ApiConstants.instructorCreate,
        headers: {"Authorization": storage.token!},
        body: {
          "name": nameController.text,
          "designation": designationController.text,
          "image": image.value,
          "linkedin": linkedinController.text,
          "instagram": instagramController.text,
          "facebook": facebookController.text,
          "twitter": twitterController.text,
        },
        decoder: (json) => json,
      );

      if (response["status"] == 200) {
        controller.fetchInstructors();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Instructor",
          message: "Instructor created successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Instructor",
        message: "Failed to create instructor",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearFields() {
    nameController.clear();
    designationController.clear();
    linkedinController.clear();
    instagramController.clear();
    facebookController.clear();
    twitterController.clear();
    image.value = "";
  }
}
