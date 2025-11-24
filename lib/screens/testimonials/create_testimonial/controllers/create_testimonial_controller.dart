import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/screens/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class CreateTestimonialController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;
  var rate = 5.obs; // 1-5

  final TextEditingController nameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  var pickedImagePath = ''.obs;
  var imageType = ImageType.asset.obs;

  void onIconButtonPressed() {}

  void createItem() {
    final list = TestimonialsController.instance;
    final nextId = list.dataList.isEmpty
        ? 1
        : (list.dataList.map((e) => e.id).reduce((a, b) => a > b ? a : b) + 1);
    final item = TestimonialModel(
      id: nextId,
      name: nameController.text.trim(),
      designation: designationController.text.trim(),
      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),
      image: pickedImagePath.value.isEmpty ? null : pickedImagePath.value,
      rate: rate.value.clamp(1, 5),
      isFeatured: isFeatured.value,
    );
    list.dataList.add(item);
    list.filteredDataList.assignAll(list.dataList);
    Get.back();
  }
}
