import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/gallery_model.dart';

class GalleryController extends GetxController {
  static GalleryController get instance => Get.find();

  final sortAscending = true.obs;
  final sortColumnIndex = 0.obs;

  final dataList = <GalleryModel>[].obs;
  final filteredDataList = <GalleryModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() {
    dataList.addAll(List.generate(12, (i) =>
        GalleryModel(
          id: i + 1,
          title: 'Gallery ${i + 1}',
          images: List.generate((i % 5) + 1, (j) => ''),
          description: i % 3 == 0 ? 'Optional description ${i + 1}' : null,
        )));
    filteredDataList.assignAll(dataList);
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int cmp;
      switch (columnIndex) {
        case 0:
          cmp = a.title.toLowerCase().compareTo(b.title.toLowerCase());
          break;
        case 1:
          cmp = a.images.length.compareTo(b.images.length);
          break;
        default:
          return 0;
      }
      return ascending ? cmp : -cmp;
    });
  }

  void searchQuery(String query) {
    final q = query.toLowerCase();
    filteredDataList.assignAll(
      dataList.where((e) =>
          e.title.toLowerCase().contains(q) ||
          (e.description ?? '').toLowerCase().contains(q)),
    );
  }

  void deleteItem(int id) {
    dataList.removeWhere((e) => e.id == id);
    filteredDataList.removeWhere((e) => e.id == id);
  }
}
