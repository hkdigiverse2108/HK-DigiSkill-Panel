import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/banner_model.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/controllers/banners_controller.dart';

class CreateBannerController extends GetxController {
  final isLoading = false.obs;
  final type = BannerType.web.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  final imagePrimary = ''.obs;
  final imageSecondary = ''.obs;

  void onPickPrimary() {}
  void onPickSecondary() {}

  void createItem() {
    final list = BannersController.instance;
    final nextId = list.dataList.isEmpty
        ? 1
        : (list.dataList.map((e) => e.id).reduce((a, b) => a > b ? a : b) + 1);
    final item = BannerModel(
      id: nextId,
      type: type.value,
      title: type.value == BannerType.web ? titleController.text.trim() : null,
      description: type.value == BannerType.web && descriptionController.text.trim().isNotEmpty
          ? descriptionController.text.trim()
          : null,
      imagePrimary: imagePrimary.value.isEmpty ? null : imagePrimary.value,
      imageSecondary: type.value == BannerType.web && imageSecondary.value.isNotEmpty
          ? imageSecondary.value
          : null,
      link: type.value == BannerType.app ? linkController.text.trim() : null,
    );
    list.dataList.add(item);
    list.filteredDataList.assignAll(list.dataList);
    Get.back();
  }
}
