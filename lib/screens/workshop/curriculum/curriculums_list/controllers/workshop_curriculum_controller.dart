import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/workshop_curriculums_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class WorkshopCurriculumController extends GetxController {
  static WorkshopCurriculumController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;
  var isLoading = false.obs;

  var dataList = <WorkshopCurriculumsModel>[].obs;
  var filteredDataList = <WorkshopCurriculumsModel>[].obs;
  final searchController = TextEditingController();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchCurriculums();
  }

  Future<void> fetchCurriculums() async {
    try {
      isLoading.value = true;
      final response = await apiService.get(
        path: ApiConstants.workshopCurriculums,
        decoder: (json) {
          final data = json['data']['workshop_curriculum_data'] as List;
          return data.map((e) => WorkshopCurriculumsModel.fromJson(e)).toList();
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

  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where(
        (curriculums) =>
            curriculums.title.toLowerCase().contains(query.toLowerCase()) ||
            curriculums.workshopId.title.toLowerCase().contains(
              query.toLowerCase(),
            ),
      ),
    );
  }

  void sort(int columnIndex, bool ascending) {
    if (columnIndex == sortColumnIndex.value) {
      sortAscending.value = ascending;
    } else {
      sortColumnIndex.value = columnIndex;
      sortAscending.value = true;
    }
  }

  void deleteCurriculums(String id) async {
    try {
      isLoading.value = true;
      final response = await apiService.delete(
        path: "${ApiConstants.workshopCurriculumsDelete}/$id",
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        AdminLoaders.successSnackBar(
          title: "Success",
          message: "Curriculum deleted successfully",
        );
        fetchCurriculums();
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
