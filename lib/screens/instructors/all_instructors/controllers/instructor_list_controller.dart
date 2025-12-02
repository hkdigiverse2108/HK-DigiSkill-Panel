import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/instructor_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class InstructorListController extends GetxController {
  static InstructorListController get instance => Get.find();

  var isLoading = false.obs;
  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <InstructorModel>[].obs;
  var filteredDataList = <InstructorModel>[].obs;
  final searchController = TextEditingController();

  final api = ApiService(baseUrl: ApiConstants.baseUrl);
  final storage = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchInstructors();
  }

  Future<void> fetchInstructors() async {
    try {
      isLoading.value = true;

      final response = await api.get(
        path: ApiConstants.instructorList,
        headers: {"Authorization": storage.token!},
        decoder: (json) {
          final list = json["data"]["instructor_data"] as List;
          return list.map((e) => InstructorModel.fromJson(e)).toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(response);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Instructors",
        message: "Failed to load instructors",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void searchQuery(String query) {
    final q = query.toLowerCase();
    filteredDataList.assignAll(
      dataList.where(
        (item) =>
            item.name.toLowerCase().contains(q) ||
            (item.designation ?? "").toLowerCase().contains(q),
      ),
    );
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int cmp = a.name.toLowerCase().compareTo(b.name.toLowerCase());
      return ascending ? cmp : -cmp;
    });
  }

  Future<void> deleteInstructor(String id) async {
    try {
      final response = await api.delete(
        path: "${ApiConstants.instructorDelete}/$id",
        headers: {"Authorization": storage.token!},
        decoder: (json) {},
      );

      fetchInstructors();
      AdminLoaders.successSnackBar(
        title: "Instructor",
        message: "Deleted successfully",
      );
    } catch (e) {
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }
}
