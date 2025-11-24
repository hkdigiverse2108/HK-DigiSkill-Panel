import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/screens/testimonials/create_testimonial/controllers/create_testimonial_controller.dart';
import 'package:hkdigiskill_admin/screens/testimonials/edit_testimonial/controllers/edit_testimonial_controller.dart';

class TestimonialsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestimonialsController>(() => TestimonialsController());
    Get.lazyPut<CreateTestimonialController>(() => CreateTestimonialController());
    Get.lazyPut<EditTestimonialController>(() => EditTestimonialController());
  }
}
