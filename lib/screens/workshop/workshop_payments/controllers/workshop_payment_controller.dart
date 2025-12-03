import 'dart:developer';

import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/workshop_payment_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class WorkshopPaymentController extends GetxController {
  static WorkshopPaymentController get instance => Get.find();

  var isLoading = false.obs;
  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;

  var dataList = <WorkshopPaymentModel>[].obs;
  var filteredDataList = <WorkshopPaymentModel>[].obs;

  final searchController = RxString("");

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchPayments();
  }

  Future<void> fetchPayments() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        path: ApiConstants.workshopPayments,
        headers: {"authorization": storageService.token!},
        decoder: (json) {
          final data = json["data"]["my_workshops_data"] as List;
          return data
              .map<WorkshopPaymentModel>(
                (e) => WorkshopPaymentModel.fromJson(e),
              )
              .toList();
        },
      );

      dataList.assignAll(response);
      filteredDataList.assignAll(dataList);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: "Failed to load payments",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void search(String query) {
    filteredDataList.assignAll(
      dataList.where(
        (p) =>
            p.user.name.toLowerCase().contains(query.toLowerCase()) ||
            p.user.email.toLowerCase().contains(query.toLowerCase()) ||
            p.workshop.title.toLowerCase().contains(query.toLowerCase()) ||
            p.paymentStatus.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int compare = 0;

      switch (columnIndex) {
        case 0:
          compare = a.user.name.compareTo(b.user.name);
          break;
        case 1:
          compare = a.workshop.title.compareTo(b.workshop.title);
          break;
        case 2:
          compare = a.finalAmount.compareTo(b.finalAmount);
          break;
      }

      return ascending ? compare : -compare;
    });
  }
}
