import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class FaqController extends GetxController {
  static FaqController get instance => Get.find();

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
        path: ApiConstants.faqWithType(DashType.home),
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
    filteredDataList.assignAll(
      dataList.where(
        (faq) =>
            faq.question.toLowerCase().contains(query.toLowerCase()) ||
            faq.answer.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  Future<void> deleteFaq(String id) async {
    try {
      final response = await apiService.delete(
        path: "${ApiConstants.faqDelete}/$id",
        headers: {"Authorization": storageService.token!},
        decoder: (json) {},
      );
      AdminLoaders.successSnackBar(
        title: "Faq",
        message: "Deleted successfully",
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
