import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/controllers/course_list_controller.dart';
import 'package:hkdigiskill_admin/screens/course/create_course/controllers/create_course_controller.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/create_curriculum/controllers/create_course_curriculum_controller.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/curriculums_list/controllers/course_curriculum_controller.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/edit_curriculum/controllers/edit_workshop_curriculum_controller.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/controllers/edit_course_controller.dart';
import 'package:hkdigiskill_admin/screens/course/faq/all_faq/controllers/faq_controller.dart';
import 'package:hkdigiskill_admin/screens/course/faq/create_faq/controllers/create_faq_controller.dart';
import 'package:hkdigiskill_admin/screens/course/faq/edit_faq/controllers/edit_faq_controller.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/all_testimonials/controllers/testimonials_controller.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/create_testimonial/controllers/create_testimonial_controller.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/edit_testimonial/controllers/edit_testimonial_controller.dart';

class CourseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseListController>(() => CourseListController());
    Get.lazyPut<CreateCourseController>(() => CreateCourseController());
    Get.lazyPut<EditCourseController>(() => EditCourseController());
    Get.lazyPut<CourseCurriculumController>(() => CourseCurriculumController());
    Get.lazyPut<EditCourseCurriculumController>(
      () => EditCourseCurriculumController(),
    );
    Get.lazyPut<CreateCourseCurriculumController>(
      () => CreateCourseCurriculumController(),
    );
    Get.lazyPut<CourseFaqController>(() => CourseFaqController());
    Get.lazyPut<CourseCreateFaqController>(() => CourseCreateFaqController());
    Get.lazyPut<CourseEditFaqController>(() => CourseEditFaqController());
    Get.lazyPut<CourseTestimonialsController>(
      () => CourseTestimonialsController(),
    );
    Get.lazyPut<CourseCreateTestimonialController>(
      () => CourseCreateTestimonialController(),
    );
    Get.lazyPut<CourseEditTestimonialController>(
      () => CourseEditTestimonialController(),
    );
  }
}
