import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/instructors/all_instructors/controllers/instructor_list_controller.dart';
import 'package:hkdigiskill_admin/screens/instructors/create_instructor/controllers/create_instructor_controller.dart';
import 'package:hkdigiskill_admin/screens/instructors/edit_instructor/controllers/edit_instructor_controller.dart';

class InstructorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstructorListController>(() => InstructorListController());
    Get.lazyPut<CreateInstructorController>(() => CreateInstructorController());
    Get.lazyPut<EditInstructorController>(() => EditInstructorController());
  }
}
