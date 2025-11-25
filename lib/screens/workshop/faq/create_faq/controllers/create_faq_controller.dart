import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class WorkshopCreateFaqController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;

  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  final faqController = WorkshopFaqController.instance;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  void createFaq() async {
    try {
      isLoading.value = true;

      final response = await apiService.post(
        path: ApiConstants.faqCreate,
        headers: {"authorization": storageService.token!},
        body: {
          "question": questionController.text,
          "answer": answerController.text,
          "isFeatured": isFeatured.value,
          "type": FaqType.workshop.name,
        },
        decoder: (json) {},
      );

      faqController.fetchFaqs();
      Get.back();
      AdminLoaders.successSnackBar(
        title: "Faq",
        message: "Created successfully",
      );
    } catch (e) {
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    } finally {
      isLoading.value = false;
    }
  }
}
