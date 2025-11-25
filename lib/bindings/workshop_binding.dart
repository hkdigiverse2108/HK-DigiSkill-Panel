import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/controllers/create_workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/create_faq/controllers/create_faq_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/edit_faq/controllers/edit_faq_controller.dart';

class WorkshopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkshopController>(() => WorkshopController());
    Get.lazyPut<CreateWorkshopController>(() => CreateWorkshopController());
    Get.lazyPut<WorkshopFaqController>(() => WorkshopFaqController());
    Get.lazyPut<WorkshopCreateFaqController>(
      () => WorkshopCreateFaqController(),
    );
    Get.lazyPut<WorkshopEditFaqController>(() => WorkshopEditFaqController());
  }
}
