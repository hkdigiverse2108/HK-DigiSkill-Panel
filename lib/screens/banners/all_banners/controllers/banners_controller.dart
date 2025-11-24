import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/banner_model.dart';

class BannersController extends GetxController {
  static BannersController get instance => Get.find();

  final sortAscending = true.obs;
  final sortColumnIndex = 0.obs;

  final dataList = <BannerModel>[].obs;
  final filteredDataList = <BannerModel>[].obs;
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  void fetchItems() {
    dataList.addAll(List.generate(10, (i) {
      if (i % 2 == 0) {
        return BannerModel(
          id: i + 1,
          type: BannerType.web,
          title: 'Web Banner ${i + 1}',
          description: 'Optional description ${i + 1}',
          imagePrimary: null,
          imageSecondary: null,
        );
      } else {
        return BannerModel(
          id: i + 1,
          type: BannerType.app,
          link: 'https://example.com/app${i + 1}',
          imagePrimary: null,
        );
      }
    }));
    filteredDataList.assignAll(dataList);
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    int byType(BannerModel m) => m.type.index;
    int byTitle(BannerModel m) => (m.title ?? '').toLowerCase().codeUnitAt(0);
    int byLink(BannerModel m) => (m.link ?? '').toLowerCase().codeUnitAt(0);

    filteredDataList.sort((a, b) {
      int cmp;
      switch (columnIndex) {
        case 0:
          cmp = byType(a).compareTo(byType(b));
          break;
        case 1:
          // Title/Link column (depends on type)
          final aKey = a.type == BannerType.web ? (a.title ?? '') : (a.link ?? '');
          final bKey = b.type == BannerType.web ? (b.title ?? '') : (b.link ?? '');
          cmp = aKey.toLowerCase().compareTo(bKey.toLowerCase());
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
      dataList.where((e) {
        final key = e.type == BannerType.web ? (e.title ?? '') : (e.link ?? '');
        return key.toLowerCase().contains(q) ||
            (e.description ?? '').toLowerCase().contains(q);
      }),
    );
  }

  void deleteItem(int id) {
    dataList.removeWhere((e) => e.id == id);
    filteredDataList.removeWhere((e) => e.id == id);
  }
}
