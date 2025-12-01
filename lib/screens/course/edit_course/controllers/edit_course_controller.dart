import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/category_model.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/category/all_category/controllers/category_controller.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class EditCourseController extends GetxController {
  static EditCourseController get instance => Get.find();

  var isLoading = false.obs;
  var purchasedCoursesShow = false.obs;

  var image = ''.obs;

  var selectedCategory = ''.obs;
  var categoryId = ''.obs;
  var categoryList = <CourseCategoryDatum>[].obs;

  // name and description
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  // price and other
  final priceController = TextEditingController();
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

  void initCourseData(CourseModel courseModel) {
    nameController.text = courseModel.name;
    descriptionController.text = courseModel.description;
    priceController.text = courseModel.price.toString();
    enrolledLearnersController.text = courseModel.enrolledLearners.toString();
    classCompletedController.text = courseModel.classCompleted.toString();
    satisfactionController.text = courseModel.satisfactionRate.toString();
    purchasedCoursesShow.value = courseModel.purchasedCoursesShow;
    selectedCategory.value = courseModel.courseCategoryId.name;
    categoryId.value = courseModel.courseCategoryId.id;
    image.value = courseModel.image;
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

  Future<void> updateCourse(CourseModel courseModel) async {
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
        path: ApiConstants.courseUpdate,
        headers: {'Authorization': '${storageService.token}'},
        body: {
          'courseId': courseModel.id,
          'name': nameController.text,
          'description': descriptionController.text,
          'price': priceController.text.isEmpty
              ? 0
              : double.parse(priceController.text),
          'enrolledLearners': enrolledLearnersController.text.isEmpty
              ? 0
              : int.parse(enrolledLearnersController.text),
          'classCompleted': classCompletedController.text.isEmpty
              ? 0
              : int.parse(classCompletedController.text),
          'satisfactionRate': satisfactionController.text.isEmpty
              ? 0
              : int.parse(satisfactionController.text),
          'purchasedCoursesShow': purchasedCoursesShow.value,
          'courseCategoryId': categoryId.value,
          'image': image.value,
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
    enrolledLearnersController.clear();
    classCompletedController.clear();
    satisfactionController.clear();
    purchasedCoursesShow.value = false;
    categoryId.value = "";
    image.value = "";
  }
}
