import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/gallery_model.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/controllers/gallery_controller.dart';

class EditGalleryController extends GetxController {
  final isLoading = false.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final images = <String>[].obs;

  void onPickImages() {}
  void onRemoveImageAt(int index) {
    images.removeAt(index);
  }

  void initItem(GalleryModel item) {
    titleController.text = item.title;
    descriptionController.text = item.description ?? '';
    images.assignAll(item.images);
  }

  void updateItem(GalleryModel item) {
    final controller = GalleryController.instance;
    final updated = item.copyWith(
      title: titleController.text.trim(),
      images: images.toList(),
      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),
    );

    final idx = controller.dataList.indexWhere((e) => e.id == item.id);
    if (idx != -1) controller.dataList[idx] = updated;
    final fidx = controller.filteredDataList.indexWhere((e) => e.id == item.id);
    if (fidx != -1) controller.filteredDataList[fidx] = updated;

    Get.back();
  }
}
