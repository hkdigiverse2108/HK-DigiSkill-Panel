import 'dart:developer';

import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/course_payment_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class CoursePaymentController extends GetxController {
  static CoursePaymentController get instance => Get.find();

  var isLoading = false.obs;
  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <CoursePurchaseModel>[].obs;
  var filteredDataList = <CoursePurchaseModel>[].obs;

  final searchController = RxString("");

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchCoursePayments();
  }

  Future<void> fetchCoursePayments() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.coursePayments,
        // <--- UPDATE THIS ENDPOINT AS NEEDED
        headers: {"authorization": storageService.token!},
        decoder: (json) {
          final data = json["data"]["my_courses_data"] as List;
          return data
              .map<CoursePurchaseModel>((e) => CoursePurchaseModel.fromJson(e))
              .toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(dataList);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: "Failed to load course payments",
      );
    } finally {
      isLoading.value = false;
    }
  }

  // --------------------------------------------------------
  // Search Logic
  // --------------------------------------------------------
  void search(String query) {
    query = query.toLowerCase();

    filteredDataList.assignAll(
      dataList.where(
        (p) =>
            // User fields
            (p.user?.email ?? "").toLowerCase().contains(query) ||
            (p.user?.phoneNumber ?? "").toLowerCase().contains(query) ||
            (p.user?.designation ?? "").toLowerCase().contains(query) ||
            // Course fields
            (p.course?.description ?? "").toLowerCase().contains(query) ||
            (p.course?.price?.toString() ?? "").contains(query) ||
            // Payment fields
            (p.paymentStatus ?? "").toLowerCase().contains(query) ||
            (p.razorpayPaymentId ?? "").toLowerCase().contains(query),
      ),
    );
  }

  // --------------------------------------------------------
  // Sorting Logic
  // --------------------------------------------------------
  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int compare = 0;

      switch (columnIndex) {
        case 0: // Sort by user email
          compare = (a.user?.email ?? "").compareTo(b.user?.email ?? "");
          break;

        case 1: // Sort by course price
          compare = (a.course?.price ?? 0).compareTo(b.course?.price ?? 0);
          break;

        case 2: // Sort by purchase date
          compare = (a.purchaseDate ?? "").compareTo(b.purchaseDate ?? "");
          break;
      }

      return ascending ? compare : -compare;
    });
  }
}
