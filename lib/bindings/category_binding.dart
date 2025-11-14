import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/category/controllers/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
