import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/controllers/workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/controllers/create_workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/create_curriculum/controllers/create_workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/curriculums_list/controllers/workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/edit_curriculum/controllers/edit_workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/edit_workshop/controllers/edit_workshop_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/create_faq/controllers/create_faq_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/edit_faq/controllers/edit_faq_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/create_testimonial/controllers/create_testimonial_controller.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/edit_testimonial/controllers/edit_testimonial_controller.dart';

class WorkshopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkshopController>(() => WorkshopController());
    Get.lazyPut<CreateWorkshopController>(() => CreateWorkshopController());
    Get.lazyPut<EditWorkshopController>(() => EditWorkshopController());
    Get.lazyPut<WorkshopCurriculumController>(
      () => WorkshopCurriculumController(),
    );
    Get.lazyPut<CreateWorkshopCurriculumController>(
      () => CreateWorkshopCurriculumController(),
    );
    Get.lazyPut<EditWorkshopCurriculumController>(
      () => EditWorkshopCurriculumController(),
    );
    Get.lazyPut<WorkshopFaqController>(() => WorkshopFaqController());
    Get.lazyPut<WorkshopCreateFaqController>(
      () => WorkshopCreateFaqController(),
    );
    Get.lazyPut<WorkshopEditFaqController>(() => WorkshopEditFaqController());
    Get.lazyPut<WorkshopTestimonialsController>(
      () => WorkshopTestimonialsController(),
    );
    Get.lazyPut<WorkshopCreateTestimonialController>(
      () => WorkshopCreateTestimonialController(),
    );
    Get.lazyPut<WorkshopEditTestimonialController>(
      () => WorkshopEditTestimonialController(),
    );
  }
}
