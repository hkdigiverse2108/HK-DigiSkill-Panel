import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateCategoryController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
}
