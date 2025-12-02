import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CourseEditFaqController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;
  final faqController = CourseFaqController.instance;
  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  var selectedCourse = ''.obs;
  var selectedCourseId = ''.obs;
  var courseList = <CourseModel>[].obs;

  final courseController = CourseListController.instance;

  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    setCourseList();
  }

  void setCourseList() {
    courseList.value = courseController.dataList;
  }

  void initFaq(FaqModel faq) {
    questionController.text = faq.question;
    answerController.text = faq.answer;
    isFeatured.value = faq.isFeatured;
    
    if (faq.learningCatalog != null) {
      selectedCourseId.value = faq.learningCatalog!.id;
      selectedCourse.value =
          faq.learningCatalog!.title ?? faq.learningCatalog!.name ?? "";
    }
  }

  void selectCourse(String courseName) {
    selectedCourse.value = courseName;
    selectedCourseId.value = courseController.dataList
        .firstWhere((course) => course.name == courseName)
        .id;
  }

  void updateFaq(FaqModel faq) async {
    try {
      isLoading.value = true;

      final response = await apiService.post(
        path: ApiConstants.faqUpdate,
        headers: {"authorization": storageService.token!},
        body: {
          "faqId": faq.id,
          "question": questionController.text,
          "answer": answerController.text,
          "isFeatured": isFeatured.value,
          "learningCatalogId": selectedCourseId.value,
        },
        decoder: (json) {},
      );

      faqController.fetchFaqs();
      Get.back();
      AdminLoaders.successSnackBar(
        title: "Faq",
        message: "Updated successfully",
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
