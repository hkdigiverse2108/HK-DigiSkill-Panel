import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/blog_model.dart';

class BlogsController extends GetxController {
  static BlogsController get instance => Get.find();

  final isLoading = false.obs;
  final searchText = ''.obs;
  final sortColumn = 'title'.obs;
  final sortAscending = true.obs;
  final filteredDataList = <BlogModel>[].obs;
  final dataList = <BlogModel>[].obs;
  final selectedRows = <BlogModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load initial data
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading.value = true;
      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock data
      dataList.assignAll([
        BlogModel(
          id: 1,
          title: 'Getting Started with Flutter',
          subtitle: 'A beginner\'s guide to Flutter',
          date: DateTime.now().subtract(const Duration(days: 5)),
          isFeatured: true,
          content: 'Full blog content here...',
          coverImage: 'https://example.com/cover1.jpg',
          mainImage: 'https://example.com/main1.jpg',
          quote: 'Flutter is amazing!',
          authorName: 'John Doe',
        ),
        // Add more mock data as needed
      ]);
      
      filterData();
    } finally {
      isLoading.value = false;
    }
  }

  void filterData() {
    if (searchText.value.isEmpty) {
      filteredDataList.assignAll(dataList);
    } else {
      filteredDataList.assignAll(
        dataList.where((blog) =>
          blog.title.toLowerCase().contains(searchText.value.toLowerCase()) ||
          (blog.subtitle?.toLowerCase().contains(searchText.value.toLowerCase()) ?? false) ||
          blog.authorName.toLowerCase().contains(searchText.value.toLowerCase())),
      );
    }
    sortData();
  }

  void sortData() {
    filteredDataList.sort((a, b) {
      int compareResult;
      switch (sortColumn.value) {
        case 'title':
          compareResult = a.title.compareTo(b.title);
          break;
        case 'date':
          compareResult = a.date.compareTo(b.date);
          break;
        case 'author':
          compareResult = a.authorName.compareTo(b.authorName);
          break;
        default:
          compareResult = a.title.compareTo(b.title);
      }
      return sortAscending.value ? compareResult : -compareResult;
    });
  }

  void onSort(String columnName, bool ascending) {
    sortColumn.value = columnName;
    sortAscending.value = ascending;
    sortData();
  }

  Future<void> deleteItem(int id) async {
    // TODO: Implement delete functionality
    dataList.removeWhere((blog) => blog.id == id);
    filterData();
  }

  Future<void> toggleFeatured(int id, bool isFeatured) async {
    // TODO: Implement toggle featured status
    final index = dataList.indexWhere((blog) => blog.id == id);
    if (index != -1) {
      final blog = dataList[index];
      dataList[index] = blog.copyWith(isFeatured: isFeatured);
      filterData();
    }
  }
}
