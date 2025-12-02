import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/legality_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class TermsConditionController extends GetxController {
  static TermsConditionController get instance => Get.find();

  var isLoading = false.obs;
  Rxn<LegalityModel> legalityData = Rxn<LegalityModel>();

  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  final String type = "termsCondition";

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.legalityFetch + type,
        headers: {'authorization': storageService.token!},
        decoder: (json) => LegalityModel.fromJson(json['data']),
      );

      legalityData.value = response;
      contentController.text = response.content;
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: "Failed to fetch Terms & Conditions",
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateData() async {
    try {
      isLoading.value = true;

      final response = await apiService.post(
        path: ApiConstants.legalityUpdate,
        headers: {'authorization': storageService.token!},
        body: {"type": type, "content": contentController.text},
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
