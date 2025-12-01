import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/course_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CourseListController extends GetxController {
  static CourseListController get instance => Get.find();
  var isLoading = false.obs;

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <CourseModel>[].obs;
  var filteredDataList = <CourseModel>[].obs;
  final searchController = TextEditingController();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    fetchCourse();
    super.onInit();
  }

  void fetchCourse() async {
    try {
      isLoading.value = true;
      final response = await apiService.get(
        path: ApiConstants.course,
        headers: {'Authorization': '${storageService.token}'},
        decoder: (json) {
          final data = json['data']['course_data'] as List;
          return data.map((e) => CourseModel.fromJson(e)).toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(response);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteCourse(String id) async {
    try {
      isLoading.value = true;
      final response = await apiService.delete(
        path: "${ApiConstants.courseDelete}/$id",
        headers: {'Authorization': '${storageService.token}'},
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        fetchCourse();
        AdminLoaders.successSnackBar(
          title: "Success",
          message: response['message'],
        );
      } else {
        AdminLoaders.errorSnackBar(
          title: "Error",
          message: response['message'],
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where(
        (course) => course.name.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
