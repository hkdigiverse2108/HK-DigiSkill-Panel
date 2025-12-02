import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/lesson_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class LessonListController extends GetxController {
  static LessonListController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;
  var isLoading = false.obs;

  var dataList = <CourseLessonModel>[].obs;
  var filteredDataList = <CourseLessonModel>[].obs;

  final searchController = TextEditingController();
  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchLessons();
  }

  Future<void> fetchLessons() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        headers: {"authorization": storageService.token!},
        path: ApiConstants.courseLessonList, // SET YOUR URL HERE
        decoder: (json) {
          final data = json['data']['course_lesson_data'] as List;
          return data
              .map<CourseLessonModel>((e) => CourseLessonModel.fromJson(e))
              .toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(dataList);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Sorting
  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int compareResult;

      switch (columnIndex) {
        case 0:
          compareResult = a.title.compareTo(b.title);
          break;
        case 1:
          compareResult = (a.subtitle ?? '').compareTo(b.subtitle ?? '');
          break;
        default:
          return 0;
      }

      return ascending ? compareResult : -compareResult;
    });
  }

  // Searching
  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where(
        (lesson) =>
            lesson.title.toLowerCase().contains(query.toLowerCase()) ||
            (lesson.courseId?.name ?? '').toLowerCase().contains(
              query.toLowerCase(),
            ),
      ),
    );
  }

  // Delete Lesson
  Future<void> deleteLesson(String id) async {
    try {
      await apiService.delete(
        path: "${ApiConstants.courseLessonDelete}/$id",
        headers: {"authorization": storageService.token!},
        decoder: (json) {},
      );

      fetchLessons();
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
