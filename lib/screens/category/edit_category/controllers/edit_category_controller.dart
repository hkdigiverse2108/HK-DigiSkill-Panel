import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/category_model.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class EditCategoryController extends GetxController {
  var isLoading = false.obs;
  var isFeatured = false.obs;
  var pickedImagePath = ''.obs;
  var imageType = ImageType.network.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void initCategory(CategoryModel category) {
    nameController.text = category.name ?? '';
    descriptionController.text = category.description ?? '';
    isFeatured.value = category.isFeatured ?? false;
    pickedImagePath.value = category.image ?? '';
  }

  void onIconButtonPressed() {}
}
