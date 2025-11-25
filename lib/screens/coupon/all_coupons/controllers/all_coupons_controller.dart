import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/coupon_code_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';

class AllCouponsController extends GetxController {
  static AllCouponsController get instance => Get.find();

  var sortAscending = true.obs;
  var sortColumnIndex = 0.obs;
  var isLoading = false.obs;

  var dataList = <CouponCodeModel>[].obs;
  var filteredDataList = <CouponCodeModel>[].obs;
  final searchController = TextEditingController();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);
  final storageService = AdminStorageService();

  @override
  void onInit() {
    super.onInit();
    fetchCoupons();
  }

  Future<void> fetchCoupons() async {
    try {
      isLoading.value = true;

      final response = await apiService.get(
        headers: {"authorization": storageService.token!},
        path: ApiConstants.coupon,
        decoder: (json) {
          final data = json['data']['coupon_code_data'] as List;
          return data
              .map<CouponCodeModel>((e) => CouponCodeModel.fromJson(e))
              .toList();
        },
      );

      dataList.assignAll(response);

      filteredDataList.assignAll(dataList);
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    } finally {
      isLoading.value = false;
    }
  }

  void sort(int columnIndex, bool ascending) {
    sortColumnIndex.value = columnIndex;
    sortAscending.value = ascending;

    filteredDataList.sort((a, b) {
      int compareResult;
      switch (columnIndex) {
        case 0:
          compareResult = a.code.compareTo(b.code);
          break;
        // case 1:
        //   compareResult = ;
        //   break;
        default:
          return 0;
      }
      return ascending ? compareResult : -compareResult;
    });
  }

  void searchQuery(String query) {
    filteredDataList.assignAll(
      dataList.where(
        (coupon) =>
            coupon.code.toLowerCase().contains(query.toLowerCase()) ||
            coupon.discountType.name.toLowerCase().contains(
              query.toLowerCase(),
            ),
      ),
    );
  }

  void deleteCoupon(String id) async {
    try {
      isLoading.value = true;
      final response = await apiService.delete(
        headers: {"authorization": storageService.token!},
        path: "${ApiConstants.couponDelete}/$id",
        decoder: (json) {},
      );
      AdminLoaders.successSnackBar(
        title: "Faq",
        message: "Deleted successfully",
      );
      fetchCoupons();
    } catch (e) {
      log(e.toString());
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
