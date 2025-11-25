import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCouponController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController couponCodeController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController minAmountController = TextEditingController();
  TextEditingController maxDiscountAmountController = TextEditingController();
  TextEditingController maxUsageController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  var discountType = 'Percentage'.obs;
  var discountTypeList = ['Percentage', 'Amount'].obs;
  var status = 'Active'.obs;
  var statusList = ['Active', 'Inactive'].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void pickDate() {}

  void formateDate(String date) {}
}
