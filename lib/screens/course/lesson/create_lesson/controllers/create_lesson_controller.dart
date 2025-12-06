import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/lesson_list/controllers/lesson_list_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CreateLessonController extends GetxController {
  static CreateLessonController get instance => Get.find();

  var isLoading = false.obs;
  var selectedCourse = ''.obs;
  var courseId = ''.obs;
  var lessonLock = false.obs;
  var courseList = <CourseModel>[].obs;
  final priorityController = TextEditingController(text: '0');

  final titleController = TextEditingController();
  final subtitleController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final courseController = CourseListController.instance;
  final lessonsController = LessonListController.instance;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    setCourseList();
  }

  void setCourseList() {
    courseList.value = courseController.dataList;
  }

  void selectCourse(String courseT) {
    if (courseT.isEmpty) {
      selectedCourse.value = "";
      courseId.value = "";
      return;
    }

    final course = courseList.firstWhere((c) => c.name == courseT);
    selectedCourse.value = course.name;
    courseId.value = course.id;
  }

  Future<void> createLesson() async {
    try {
      if (!formKey.currentState!.validate()) return;

      if (courseId.value.isEmpty) {
        AdminLoaders.errorSnackBar(
          title: "Lesson",
          message: "Please select a course",
        );
        return;
      }

      isLoading.value = true;

      final response = await apiService.post(
        path: ApiConstants.courseLessonCreate,
        headers: {'Authorization': storageService.token!},
        body: {
          'courseId': courseId.value,
          'title': titleController.text,
          'subtitle': subtitleController.text,
          'priority': int.tryParse(priorityController.text) ?? 0,
          'lessonLock': lessonLock.value,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        lessonsController.fetchLessons();
        Get.back();

        AdminLoaders.successSnackBar(
          title: "Lesson",
          message: "Lesson created successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Lesson",
        message: "Failed to create lesson",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearFields() {
    titleController.clear();
    subtitleController.clear();
    priorityController.text = '0';
    selectedCourse.value = "";
    courseId.value = "";
    lessonLock.value = false;
  }
}
