import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';

class TestimonialsController extends GetxController {
  static TestimonialsController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <TestimonialModel>[].obs;
  var filteredDataList = <TestimonialModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchTestimonials();
  }

  void fetchTestimonials() {
    dataList.addAll(List.generate(
      20,
      (i) => TestimonialModel(
        id: i + 1,
        name: 'User ${i + 1}',
        designation: 'Role ${i + 1}',
        description: 'Great experience #${i + 1}',
        image: null,
        rate: (i % 5) + 1,
        isFeatured: i % 4 == 0,
      ),
    ));
    filteredDataList.assignAll(dataList);
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int cmp;
      switch (columnIndex) {
        case 0:
          cmp = a.name.compareTo(b.name);
          break;
        case 1:
          cmp = a.designation.compareTo(b.designation);
          break;
        case 2:
          cmp = (a.rate).compareTo(b.rate);
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
          e.name.toLowerCase().contains(q) ||
          e.designation.toLowerCase().contains(q) ||
          (e.description ?? '').toLowerCase().contains(q)),
    );
  }

  void deleteItem(int id) {
    dataList.removeWhere((e) => e.id == id);
    filteredDataList.removeWhere((e) => e.id == id);
  }

  void toggleFeatured(int id) {
    final idx = dataList.indexWhere((e) => e.id == id);
    if (idx != -1) {
      final updated = dataList[idx].copyWith(isFeatured: !dataList[idx].isFeatured);
      dataList[idx] = updated;
      final fidx = filteredDataList.indexWhere((e) => e.id == id);
      if (fidx != -1) filteredDataList[fidx] = updated;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
