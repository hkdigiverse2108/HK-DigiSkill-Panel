import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/screens/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class EditTestimonialController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;
  var rate = 5.obs; // 1-5

  final TextEditingController nameController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  var pickedImagePath = ''.obs;
  var imageType = ImageType.asset.obs;

  void onIconButtonPressed() {}

  void initItem(TestimonialModel item) {
    nameController.text = item.name;
    designationController.text = item.designation;
    descriptionController.text = item.description ?? '';
    isFeatured.value = item.isFeatured;
    rate.value = item.rate;
    pickedImagePath.value = item.image ?? '';
    imageType.value = item.image == null ? ImageType.asset : ImageType.network;
  }

  void updateItem(TestimonialModel item) {
    final controller = TestimonialsController.instance;
    final updated = item.copyWith(
      name: nameController.text.trim(),
      designation: designationController.text.trim(),
      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),
      image: pickedImagePath.value.isEmpty ? null : pickedImagePath.value,
      rate: rate.value.clamp(1, 5),
      isFeatured: isFeatured.value,
    );

    final idx = controller.dataList.indexWhere((e) => e.id == item.id);
    if (idx != -1) controller.dataList[idx] = updated;
    final fidx = controller.filteredDataList.indexWhere((e) => e.id == item.id);
    if (fidx != -1) controller.filteredDataList[fidx] = updated;

    Get.back();
  }
}
