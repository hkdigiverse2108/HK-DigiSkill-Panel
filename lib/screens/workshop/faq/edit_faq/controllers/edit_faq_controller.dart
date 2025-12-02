import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/data/models/workshop_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class WorkshopEditFaqController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;
  final faqController = WorkshopFaqController.instance;
  var workshopController = WorkshopController.instance;
  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  var selectedWorkshopId = ''.obs;
  var selectedWorkshopName = ''.obs;
  var workshopList = <WorkshopModel>[].obs;

  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    setWorkshopList();
  }

  void setWorkshopList() {
    workshopList.value = workshopController.dataList;
  }

  void selectWorkshop(String title) {
    final workshop = workshopList.firstWhere((w) => w.title == title);
    selectedWorkshopId.value = workshop.id;
    selectedWorkshopName.value = workshop.title;
  }

  void initFaq(FaqModel faq) {
    questionController.text = faq.question;
    answerController.text = faq.answer;
    isFeatured.value = faq.isFeatured;

    if (faq.learningCatalog != null) {
      selectedWorkshopId.value = faq.learningCatalog!.id;
      selectedWorkshopName.value =
          faq.learningCatalog!.title ?? faq.learningCatalog!.name ?? "";
    }
  }

  void updateFaq(FaqModel faq) async {
    try {
      isLoading.value = true;

      final response = await apiService.post(
        path: ApiConstants.faqUpdate,
        headers: {"authorization": storageService.token!},
        body: {
          "faqId": faq.id,
          "question": questionController.text,
          "answer": answerController.text,
          "isFeatured": isFeatured.value,
          "learningCatalogId": selectedWorkshopId.value,
        },
        decoder: (json) {},
      );

      faqController.fetchFaqs();
      Get.back();
      AdminLoaders.successSnackBar(
        title: "Faq",
        message: "Updated successfully",
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
