import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/gallery_model.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/controllers/gallery_controller.dart';

class CreateGalleryController extends GetxController {
  final isLoading = false.obs;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final images = <String>[].obs;

  void onPickImages() {}
  void onRemoveImageAt(int index) {
    images.removeAt(index);
  }

  void createItem() {
    final list = GalleryController.instance;
    final nextId = list.dataList.isEmpty
        ? 1
        : (list.dataList.map((e) => e.id).reduce((a, b) => a > b ? a : b) + 1);
    final item = GalleryModel(
      id: nextId,
      title: titleController.text.trim(),
      images: images.toList(),
      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),
    );
    list.dataList.add(item);
    list.filteredDataList.assignAll(list.dataList);
    Get.back();
  }
}
