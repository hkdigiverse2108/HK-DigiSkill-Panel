import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/category/all_category/controllers/category_controller.dart';
import 'package:hkdigiskill_admin/screens/category/create_category/controllers/create_category_controller.dart';
import 'package:hkdigiskill_admin/screens/category/edit_category/controllers/edit_category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<EditCategoryController>(() => EditCategoryController());
    Get.lazyPut<CreateCategoryController>(() => CreateCategoryController());
  }
}
