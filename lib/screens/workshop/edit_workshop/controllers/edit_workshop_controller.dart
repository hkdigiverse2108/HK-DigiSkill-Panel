import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/data/models/workshop_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class EditWorkshopController extends GetxController {
  static EditWorkshopController get instance => Get.find();

  var isLoading = false.obs;

  // thumbnail image
  var thumbnailImage = "".obs;

  // pdf select
  var pdfFile = "".obs;

  // title and description
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final descriptionController = TextEditingController();

  // pricing & other details
  final priceController = TextEditingController();
  final mrpPriceController = TextEditingController();
  final durationController = TextEditingController();
  final languageController = TextEditingController();
  final validForController = TextEditingController();
  final couponController = TextEditingController();

  final titleSectionForm = GlobalKey<FormState>();
  final pricingSectionForm = GlobalKey<FormState>();

  final workshopController = WorkshopController.instance;

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      thumbnailImage.value = selectedImages.first.url;
    }
  }

  void selectPdfFile() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    if (selectedImages != null && selectedImages.isNotEmpty) {
      pdfFile.value = selectedImages.first.url;
    }
  }

  void initEditField(WorkshopModel workshop) {
    titleController.text = workshop.title;
    subtitleController.text = workshop.subTitle ?? "";
    descriptionController.text = workshop.about ?? "";
    priceController.text = workshop.price.toString();
    mrpPriceController.text = workshop.mrpPrice.toString();
    durationController.text = workshop.duration;
    languageController.text = workshop.language;
    validForController.text = workshop.validFor ?? "";
    couponController.text = workshop.couponCode ?? "";
    thumbnailImage.value = workshop.image;
    pdfFile.value = workshop.pdfAttach ?? "";
  }

  void clearField() {
    thumbnailImage.value = "";
    pdfFile.value = "";
    titleController.clear();
    subtitleController.clear();
    descriptionController.clear();
    priceController.clear();
    mrpPriceController.clear();
    durationController.clear();
    languageController.clear();
    validForController.clear();
    couponController.clear();
  }

  Future<void> updateWorkshop(WorkshopModel workshop) async {
    try {
      isLoading.value = true;
      if (!titleSectionForm.currentState!.validate() &&
          !pricingSectionForm.currentState!.validate()) {
        return;
      }

      if (thumbnailImage.isEmpty) {
        AdminLoaders.warningSnackBar(
          title: "Thumbnail Image",
          message: "Please select a thumbnail image",
        );
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.workshopUpdate,
        headers: {"Authorization": "${storageService.token}"},
        body: {
          "workshopId": workshop.id,
          "title": titleController.text,
          if (subtitleController.text.isNotEmpty)
            "subTitle": subtitleController.text,
          if (descriptionController.text.isNotEmpty)
            "about": descriptionController.text,
          if (priceController.text.isNotEmpty)
            "price": double.parse(priceController.text),
          if (mrpPriceController.text.isNotEmpty)
            "mrpPrice": double.parse(mrpPriceController.text),
          if (durationController.text.isNotEmpty)
            "duration": durationController.text,
          if (languageController.text.isNotEmpty)
            "language": languageController.text,
          if (validForController.text.isNotEmpty)
            "validFor": validForController.text,
          if (couponController.text.isNotEmpty)
            "couponCode": couponController.text,
          if (thumbnailImage.isNotEmpty) "image": thumbnailImage.value,
          if (pdfFile.isNotEmpty) "pdfAttach": pdfFile.value,
        },
        decoder: (json) => json as Map<String, dynamic>,
      );

      if (response['status'] == 200) {
        clearField();
        workshopController.fetchWorkshops();
        Get.back();
        AdminLoaders.successSnackBar(
          title: "Workshop Updated",
          message: "Workshop updated successfully",
        );
      }
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
