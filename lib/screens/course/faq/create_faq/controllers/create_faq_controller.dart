import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

import '../../../../../data/models/course_model.dart';

class CourseCreateFaqController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;

  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  final faqController = CourseFaqController.instance;

  var selectedCourse = ''.obs;
  var selectedCourseId = ''.obs;
  var courseList = <CourseModel>[].obs;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  final courseController = CourseListController.instance;

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
        .firstWhere((element) => element.name == courseName)
        .id;
  }

  void createFaq() async {
    try {
      isLoading.value = true;

      final response = await apiService.post(
        path: ApiConstants.faqCreate,
        headers: {"authorization": storageService.token!},
        body: {
          "question": questionController.text,
          "answer": answerController.text,
          "isFeatured": isFeatured.value,
          "type": DashType.course.name,
          "learningCatalogId": selectedCourseId.value,
        },
        decoder: (json) {},
      );

      faqController.fetchFaqs();
      Get.back();
      AdminLoaders.successSnackBar(
        title: "Faq",
        message: "Created successfully",
      );
    } catch (e) {
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
