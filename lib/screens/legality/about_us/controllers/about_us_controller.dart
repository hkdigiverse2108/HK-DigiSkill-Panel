import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class AboutUsController extends GetxController {
  static AboutUsController get instance => Get.find();

  var isLoading = false.obs;
  Rxn<AboutUsModel> legalityData = Rxn<AboutUsModel>();

  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.legalityAboutUs,
        headers: {'authorization': storageService.token!},
        decoder: (json) => AboutUsModel.fromJson(json['data']),
      );

      legalityData.value = response;
      contentController.text = response.aboutUs;
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: "Failed to fetch About Us",
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateData() async {
    try {
      isLoading.value = true;

      final response = await apiService.post(
        path: ApiConstants.aboutUsUpdate,
        headers: {'authorization': storageService.token!},
        body: {"aboutUs": contentController.text},
        decoder: (json) => json,
      );

      if (response["status"] == 200) {
        fetchData();
        AdminLoaders.successSnackBar(
          title: "Updated",
          message: "Terms & Conditions updated successfully",
        );
      }
    } catch (e) {
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: "Failed to update Terms & Conditions",
      );
    } finally {
      isLoading.value = false;
    }
  }
}

class AboutUsModel {
  final String aboutUs;

  AboutUsModel({required this.aboutUs});

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(aboutUs: json['aboutUs']);
  }
}
