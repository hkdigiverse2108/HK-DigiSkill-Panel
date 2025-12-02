import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/newsletter/all_newsletter/controllers/newsletter_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CreateNewsletterController extends GetxController {
  static CreateNewsletterController get instance => Get.find();

  var isLoading = false.obs;

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storage = AdminStorageService();

  Future<void> createNewsletter() async {
    try {
      if (!formKey.currentState!.validate()) return;
      isLoading.value = true;

      final response = await apiService.post(
        path: ApiConstants.newsletterCreate,
        headers: {"Authorization": storage.token!},
        body: {"email": emailController.text},
        decoder: (json) => json,
      );

      if (response['status'] == 200) {
        NewsletterController.instance.fetchNewsletter();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Newsletter",
          message: "Subscriber added successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Newsletter",
        message: "Failed to add subscriber",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
