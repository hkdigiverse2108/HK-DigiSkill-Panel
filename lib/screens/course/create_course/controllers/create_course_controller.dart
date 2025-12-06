import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/category_model.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/category/all_category/controllers/category_controller.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CreateCourseController extends GetxController {
  static CreateCourseController get instance => Get.find();

  var isLoading = false.obs;
  var purchasedCoursesShow = false.obs;

  var image = ''.obs;
  var attachment = ''.obs;

  var selectedCategory = ''.obs;
  var categoryId = ''.obs;
  var categoryList = <CourseCategoryDatum>[].obs;

  // name and description
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  // price and other
  final priceController = TextEditingController();
  final mrpPriceController = TextEditingController();
  final languageController = TextEditingController();
  final durationController = TextEditingController();
  final enrolledLearnersController = TextEditingController();
  final classCompletedController = TextEditingController();
  final satisfactionController = TextEditingController();

  final categoryController = Get.put(CategoryController());
  final courseListController = CourseListController.instance;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  final nameSectionForm = GlobalKey<FormState>();
  final priceSectionForm = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    setCategoryList();
  }

  void setCategoryList() {
    categoryList.value = categoryController.dataList;
  }

  void selectImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      image.value = selectedImages.first.url;
    }
  }

  void selectPdfFile() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      attachment.value = selectedImages.first.url;
    }
  }

  void selectCategory(String categoryT) {
    if (categoryT == "") {
      selectedCategory.value = "";
      categoryId.value = "";
      return;
    }

    final category = categoryList.firstWhere(
      (category) => category.name == categoryT,
    );
    selectedCategory.value = category.name;
    categoryId.value = category.id;
  }

  Future<void> createCourse() async {
    try {
      isLoading.value = true;
      if (!nameSectionForm.currentState!.validate()) return;
      if (!priceSectionForm.currentState!.validate()) return;
      if (image.value.isEmpty) {
        AdminLoaders.errorSnackBar(
          title: "Course",
          message: "Please select an image",
        );
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.courseCreate,
        headers: {'Authorization': '${storageService.token}'},
        body: {
          "name": nameController.text,
          "description": descriptionController.text,
          "price": priceController.text,
          "mrpPrice": mrpPriceController.text,
          "language": languageController.text,
          "duration": durationController.text,
          "enrolledLearners": enrolledLearnersController.text,
          "classCompleted": classCompletedController.text,
          "satisfactionRate": satisfactionController.text,
          "purchasedCoursesShow": purchasedCoursesShow.value,
          "courseCategoryId": categoryId.value,
          "image": image.value,
          "courseCurriculumIds": [],
          if (attachment.value.isNotEmpty) "pdf": attachment.value,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        courseListController.fetchCourse();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Course",
          message: "Course created successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Course",
        message: "Failed to create course",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearField() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    mrpPriceController.clear();
    languageController.clear();
    durationController.clear();
    enrolledLearnersController.clear();
    classCompletedController.clear();
    satisfactionController.clear();
    purchasedCoursesShow.value = false;
    categoryId.value = "";
    image.value = "";
  }

  @override
  void onClose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    mrpPriceController.dispose();
    languageController.dispose();
    durationController.dispose();
    enrolledLearnersController.dispose();
    classCompletedController.dispose();
    satisfactionController.dispose();
    super.onClose();
  }
}
