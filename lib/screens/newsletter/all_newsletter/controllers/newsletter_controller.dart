import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/newsletter_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class NewsletterController extends GetxController {
  static NewsletterController get instance => Get.find();

  var isLoading = false.obs;
  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <NewsletterModel>[].obs;
  var filteredDataList = <NewsletterModel>[].obs;

  final searchController = TextEditingController();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storage = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchNewsletter();
  }

  Future<void> fetchNewsletter() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.newsletterList,
        headers: {"Authorization": storage.token!},
        decoder: (json) {
          final list = json['data']['newsletter_data'] as List;
          return list.map((e) => NewsletterModel.fromJson(e)).toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(response);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Newsletter",
        message: "Failed to load subscribers",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int result;

      switch (columnIndex) {
        case 0:
          result = a.email.compareTo(b.email);
          break;
        case 1:
          result = a.dateTime.compareTo(b.dateTime);
          break;
        default:
          result = 0;
      }

      return ascending ? result : -result;
    });
  }

  void searchQuery(String query) {
    final lower = query.toLowerCase();

    filteredDataList.assignAll(
      dataList.where((item) => item.email.toLowerCase().contains(lower)),
    );
  }

  Future<void> deleteSubscriber(String id) async {
    try {
      final response = await apiService.delete(
        path: "${ApiConstants.newsletterDelete}/$id",
        headers: {"Authorization": storage.token!},
        decoder: (json) {},
      );

      fetchNewsletter();
      AdminLoaders.successSnackBar(
        title: "Newsletter",
        message: "Subscriber removed",
      );
    } catch (e) {
      AdminLoaders.errorSnackBar(title: "Newsletter", message: "Delete failed");
    }
  }
}
