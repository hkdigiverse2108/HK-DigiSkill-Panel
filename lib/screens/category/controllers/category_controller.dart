import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <CategoryModel>[].obs;
  var filteredDataList = <CategoryModel>[].obs;

  RxList<bool> selectedRows = <bool>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() {
    dataList.addAll(
      List.generate(
        36,
        (index) => CategoryModel(
          id: index + 1,
          name: "Category ${index + 1}",
          image: '',
          courseCount: 2,
          isFeatured: false,
        ),
      ),
    );

    selectedRows.assignAll(List.generate(36, (index) => false));

    filteredDataList.assignAll(dataList);
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int compareResult;
      switch (columnIndex) {
        case 0: // ID column
          compareResult = a.id.compareTo(b.id);
          break;
        case 1: // Name column
          compareResult = a.name.compareTo(b.name);
          break;
        // Add more cases for other sortable columns
        default:
          return 0;
      }
      return ascending ? compareResult : -compareResult;
    });
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where((element) => element.name.contains(query.toLowerCase())),
    );
  }
}
