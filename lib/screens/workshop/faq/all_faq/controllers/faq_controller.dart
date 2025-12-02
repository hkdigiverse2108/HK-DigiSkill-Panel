import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class WorkshopFaqController extends GetxController {
  static WorkshopFaqController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;
  var isLoading = false.obs;

  var dataList = <FaqModel>[].obs;
  var filteredDataList = <FaqModel>[].obs;
  final searchController = TextEditingController();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchFaqs();
  }

  Future<void> fetchFaqs() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        headers: {"authorization": storageService.token!},
        path: ApiConstants.faqWithType(DashType.workshop),
        decoder: (json) {
          final data = json['data']['faq_data'] as List;
          return data.map<FaqModel>((e) => FaqModel.fromJson(e)).toList();
        },
      );

      dataList.assignAll(response);

      filteredDataList.assignAll(dataList);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int compareResult;
      switch (columnIndex) {
        case 0:
          compareResult = a.question.compareTo(b.question);
          break;
        case 1:
          compareResult = a.answer.compareTo(b.answer);
          break;
        default:
          return 0;
      }
      return ascending ? compareResult : -compareResult;
    });
  }

  void searchQuery(String query) {
    final lower = query.toLowerCase();

    filteredDataList.assignAll(
      dataList.where((faq) {
        final q = faq.question.toLowerCase();
        final a = faq.answer.toLowerCase();

        // Workshop name inside learningCatalog
        final workshopName =
            (faq.learningCatalog != null && faq.learningCatalog!.title != null)
            ? faq.learningCatalog!.title!.toLowerCase()
            : "";

        return q.contains(lower) ||
            a.contains(lower) ||
            workshopName.contains(lower);
      }),
    );
  }

  Future<void> deleteFaq(String id) async {
    try {
      final response = await apiService.delete(
        path: "${ApiConstants.faqDelete}/$id",
        headers: {"token": storageService.token!},
        decoder: (json) {},
      );
      fetchFaqs();
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    }
  }

  void toggleFeatured(String id) {}

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
