import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class CourseEditTestimonialController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;
  var rate = 5.obs; // 1-5

  final TextEditingController nameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final editTestimonialFormKey = GlobalKey<FormState>();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  final controller = CourseTestimonialsController.instance;

  var selectedCourse = ''.obs;
  var selectedCourseId = ''.obs;
  var courseList = <CourseModel>[].obs;

  final courseController = CourseListController.instance;

  var pickedImagePath = ''.obs;
  var imageType = ImageType.asset.obs;

  @override
  void onInit() {
    super.onInit();
    setCourseList();
  }

  void setCourseList() {
    courseList.value = courseController.dataList;
  }

  void selectCourse(String courseName) {
    selectedCourse.value = courseName;
    selectedCourseId.value = courseController.dataList
        .firstWhere((course) => course.name == courseName)
        .id;
  }

  void onIconButtonPressed() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      pickedImagePath.value = selectedImages.first.url;
    }
  }

  void initItem(TestimonialModel item) {
    nameController.text = item.name;
    designationController.text = item.designation;
    descriptionController.text = item.description ?? '';
    isFeatured.value = item.isFeatured;
    rate.value = item.rate;
    pickedImagePath.value = item.image ?? '';
    imageType.value = item.image == null ? ImageType.asset : ImageType.network;
    if (item.learningCatalog != null) {
      selectedCourseId.value = item.learningCatalog!.id;
      selectedCourse.value =
          item.learningCatalog!.title ?? item.learningCatalog!.name ?? "";
    }
  }

  void updateItem(TestimonialModel item) async {
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
      if (!editTestimonialFormKey.currentState!.validate()) {
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.testimonialsUpdate,
        headers: {"authorization": storageService.token!},
        body: {
          "testimonialId": item.id,
          "name": nameController.text,
          "designation": designationController.text,
          "description": descriptionController.text,
          "rate": rate.value,
          "isFeatured": isFeatured.value,
          "learningCatalogId": selectedCourseId.value,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        controller.fetchTestimonials();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Testimonial updated successfully.",
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
