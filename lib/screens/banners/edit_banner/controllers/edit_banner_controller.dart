import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/banner_model.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/controllers/banners_controller.dart';

class EditBannerController extends GetxController {
  final isLoading = false.obs;
  final type = BannerType.web.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController linkController = TextEditingController();

  final imagePrimary = ''.obs;
  final imageSecondary = ''.obs;

  void onPickPrimary() {}
  void onPickSecondary() {}

  void initItem(BannerModel item) {
    type.value = item.type;
    titleController.text = item.title ?? '';
    descriptionController.text = item.description ?? '';
    linkController.text = item.link ?? '';
    imagePrimary.value = item.imagePrimary ?? '';
    imageSecondary.value = item.imageSecondary ?? '';
  }

  void updateItem(BannerModel item) {
    final controller = BannersController.instance;
    final updated = item.copyWith(
      type: type.value,
      title: type.value == BannerType.web ? titleController.text.trim() : null,
      description: type.value == BannerType.web && descriptionController.text.trim().isNotEmpty
          ? descriptionController.text.trim()
          : null,
      link: type.value == BannerType.app ? linkController.text.trim() : null,
      imagePrimary: imagePrimary.value.isEmpty ? null : imagePrimary.value,
      imageSecondary: type.value == BannerType.web && imageSecondary.value.isNotEmpty
          ? imageSecondary.value
          : null,
    );

    final idx = controller.dataList.indexWhere((e) => e.id == item.id);
    if (idx != -1) controller.dataList[idx] = updated;
    final fidx = controller.filteredDataList.indexWhere((e) => e.id == item.id);
    if (fidx != -1) controller.filteredDataList[fidx] = updated;

    Get.back();
  }
}
