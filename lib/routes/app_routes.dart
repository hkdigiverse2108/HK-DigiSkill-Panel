import 'package:get/get.dart';
import 'package:hkdigiskill_admin/bindings/banners_binding.dart';
import 'package:hkdigiskill_admin/bindings/blog_binding.dart';
import 'package:hkdigiskill_admin/bindings/category_binding.dart';
import 'package:hkdigiskill_admin/bindings/coupon_binding.dart';
import 'package:hkdigiskill_admin/bindings/course_binding.dart';
import 'package:hkdigiskill_admin/bindings/deleted_accounts_binding.dart';
import 'package:hkdigiskill_admin/bindings/faq_binding.dart';
import 'package:hkdigiskill_admin/bindings/gallery_binding.dart';
import 'package:hkdigiskill_admin/bindings/get_in_touch_binding.dart';
import 'package:hkdigiskill_admin/bindings/instructor_binding.dart';
import 'package:hkdigiskill_admin/bindings/legality_binding.dart';
import 'package:hkdigiskill_admin/bindings/login_binding.dart';
import 'package:hkdigiskill_admin/bindings/media_binding.dart';
import 'package:hkdigiskill_admin/bindings/newsletter_binding.dart';
import 'package:hkdigiskill_admin/bindings/otp_binding.dart';
import 'package:hkdigiskill_admin/bindings/partners_binding.dart';
import 'package:hkdigiskill_admin/bindings/testimonials_binding.dart';
import 'package:hkdigiskill_admin/bindings/workshop_binding.dart';
import 'package:hkdigiskill_admin/data/models/settings_binding.dart';
import 'package:hkdigiskill_admin/data/models/users_binding.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/routes/routes_middleware.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/all_banners.dart';
import 'package:hkdigiskill_admin/screens/banners/create_banner/create_banner.dart';
import 'package:hkdigiskill_admin/screens/banners/edit_banner/edit_banner.dart';
import 'package:hkdigiskill_admin/screens/blog/all_blogs/all_blogs.dart';
import 'package:hkdigiskill_admin/screens/blog/create_blog/create_blog.dart';
import 'package:hkdigiskill_admin/screens/blog/edit_blog/edit_blog.dart';
import 'package:hkdigiskill_admin/screens/category/all_category/category.dart';
import 'package:hkdigiskill_admin/screens/category/create_category/create_category.dart';
import 'package:hkdigiskill_admin/screens/category/edit_category/edit_category.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/all_coupons.dart';
import 'package:hkdigiskill_admin/screens/coupon/create_coupon/create_coupon.dart';
import 'package:hkdigiskill_admin/screens/coupon/update_coupon/edit_coupon.dart';
import 'package:hkdigiskill_admin/screens/course/course_list/course_list.dart';
import 'package:hkdigiskill_admin/screens/course/create_course/create_course.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/create_curriculum/create_course_curriculum.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/curriculums_list/course_curriculums.dart';
import 'package:hkdigiskill_admin/screens/course/curriculum/edit_curriculum/edit_course_curriculum.dart';
import 'package:hkdigiskill_admin/screens/course/edit_course/edit_course.dart';

// import 'package:hkdigiskill_admin/screens/coupon/create_coupon/create_coupon.dart';
import 'package:hkdigiskill_admin/screens/course/faq/all_faq/all_faq.dart';
import 'package:hkdigiskill_admin/screens/course/faq/create_faq/create_faq.dart';
import 'package:hkdigiskill_admin/screens/course/faq/edit_faq/edit_faq.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/create_lesson/create_lesson.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/edit_lesson/edit_lesson.dart';
import 'package:hkdigiskill_admin/screens/course/lesson/lesson_list/lesson_list.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/all_testimonials/all_testimonials.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/create_testimonial/create_testimonial.dart';
import 'package:hkdigiskill_admin/screens/course/testimonials/edit_testimonial/edit_testimonial.dart';
import 'package:hkdigiskill_admin/screens/dashboard/dashboard.dart';
import 'package:hkdigiskill_admin/screens/deleted_accounts/deleted_accounts.dart';
import 'package:hkdigiskill_admin/screens/faq/all_faq/all_faq.dart';
import 'package:hkdigiskill_admin/screens/faq/create_faq/create_faq.dart';
import 'package:hkdigiskill_admin/screens/faq/edit_faq/edit_faq.dart';
import 'package:hkdigiskill_admin/screens/forgot_password/forgot_password.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/all_gallery.dart';
import 'package:hkdigiskill_admin/screens/gallery/create_gallery/create_gallery.dart';
import 'package:hkdigiskill_admin/screens/gallery/edit_gallery/edit_gallery.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/all_get_in_touch/all_get_in_touch.dart';
import 'package:hkdigiskill_admin/screens/get_in_touch/edit_get_in_touch/edit_get_in_touch.dart';
import 'package:hkdigiskill_admin/screens/instructors/all_instructors/all_instructors.dart';
import 'package:hkdigiskill_admin/screens/instructors/create_instructor/create_instructor.dart';
import 'package:hkdigiskill_admin/screens/instructors/edit_instructor/edit_instructor.dart';
import 'package:hkdigiskill_admin/screens/legality/about_us/responsive_screens/about_us_desktop.dart';
import 'package:hkdigiskill_admin/screens/legality/refund_policy/responsive_screens/refund_policy_desktop.dart';
import 'package:hkdigiskill_admin/screens/legality/terms_condition/responsive_screens/terms_condition_desktop.dart';
import 'package:hkdigiskill_admin/screens/login/login_page.dart';
import 'package:hkdigiskill_admin/screens/media/media.dart';
import 'package:hkdigiskill_admin/screens/newsletter/all_newsletter/newsletter.dart';
import 'package:hkdigiskill_admin/screens/newsletter/create_newsletter/create_newsletter.dart';
import 'package:hkdigiskill_admin/screens/otp/otp.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/all_partners.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/create_partners/create_partners.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/edit_partners/edit_partners.dart';
import 'package:hkdigiskill_admin/screens/reset_password/reset_password.dart';
import 'package:hkdigiskill_admin/screens/settings/settings.dart';
import 'package:hkdigiskill_admin/screens/testimonials/all_testimonials/all_testimonials.dart';
import 'package:hkdigiskill_admin/screens/testimonials/create_testimonial/create_testimonial.dart';
import 'package:hkdigiskill_admin/screens/testimonials/edit_testimonial/edit_testimonial.dart';
import 'package:hkdigiskill_admin/screens/users/users.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/all_workshop.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/create_workshop.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/create_curriculum/create_workshop_curriculum.dart';
import 'package:hkdigiskill_admin/screens/workshop/curriculum/edit_curriculum/edit_workshop_curriculum.dart';
import 'package:hkdigiskill_admin/screens/workshop/edit_workshop/edit_workshop.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/all_faq/all_faq.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/create_faq/create_faq.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/edit_faq/edit_faq.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/all_testimonials/all_testimonials.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/create_testimonial/create_testimonial.dart';
import 'package:hkdigiskill_admin/screens/workshop/testimonials/edit_testimonial/edit_testimonial.dart';
import 'package:hkdigiskill_admin/screens/workshop/workshop_payments/workshop_payments.dart';

import '../screens/course/course_payments/course_payments.dart';
import '../screens/legality/privacy_policy/responsive_screens/privacy_policy_desktop.dart'
    show PrivacyPolicyDesktopScreen;
import '../screens/workshop/curriculum/curriculums_list/workshop_curriculums.dart';

class AppRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: AdminRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AdminRoutes.otp,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AdminRoutes.forgotPassword,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(name: AdminRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(
      name: AdminRoutes.dashboard,
      page: () => DashboardScreen(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.media,
      page: () => MediaScreen(),
      binding: MediaBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    // GetPage(
    //   name: AdminRoutes.transactions,
    //   page: () => TransactionsScreen(),
    //   middlewares: [RoutesMiddleware()],
    // ),

    // Category
    GetPage(
      name: AdminRoutes.category,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createCategory,
      page: () => CreateCategoryScreen(),
      binding: CategoryBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editCategory,
      page: () => EditCategoryScreen(),
      binding: CategoryBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Workshop
    GetPage(
      name: AdminRoutes.wWorkshops,
      page: () => AllWorkshopScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createWorkshop,
      page: () => CreateWorkshopScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editWorkshop,
      page: () => EditWorkshopScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wFaq,
      page: () => WorkshopAllFaqScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wCreateFaq,
      page: () => WorkshopCreateFaqScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wEditFaq,
      page: () => WorkshopEditFaqScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wTestimonials,
      page: () => WorkshopAllTestimonialsScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wCreateTestimonial,
      page: () => WorkshopCreateTestimonialScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wEditTestimonial,
      page: () => WorkshopEditTestimonialScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wCurriculum,
      page: () => WorkshopCurriculums(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wCreateCurriculum,
      page: () => CreateWorkshopCurriculum(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wEditCurriculum,
      page: () => EditWorkshopCurriculum(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.wBuy,
      page: () => WorkshopPayments(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // FAQ
    GetPage(
      name: AdminRoutes.faq,
      page: () => AllFaqScreen(),
      binding: FaqBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createFaq,
      page: () => CreateFaqScreen(),
      binding: FaqBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editFaq,
      page: () => EditFaqScreen(),
      binding: FaqBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Gallery
    GetPage(
      name: AdminRoutes.gallery,
      page: () => AllGalleryScreen(),
      binding: GalleryBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createGallery,
      page: () => CreateGalleryScreen(),
      binding: GalleryBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editGallery,
      page: () => EditGalleryScreen(),
      binding: GalleryBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Banners
    GetPage(
      name: AdminRoutes.banners,
      page: () => AllBannersScreen(),
      binding: BannersBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createBanner,
      page: () => CreateBannerScreen(),
      binding: BannersBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editBanner,
      page: () => EditBannerScreen(),
      binding: BannersBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Testimonials
    GetPage(
      name: AdminRoutes.testimonials,
      page: () => AllTestimonialsScreen(),
      binding: TestimonialsBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createTestimonial,
      page: () => CreateTestimonialScreen(),
      binding: TestimonialsBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editTestimonial,
      page: () => EditTestimonialScreen(),
      binding: TestimonialsBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Get In Touch
    GetPage(
      name: AdminRoutes.getInTouch,
      page: () => AllGetInTouchScreen(),
      binding: GetInTouchBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editGetInTouch,
      page: () => EditGetInTouchScreen(),
      binding: GetInTouchBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Deleted Accounts
    GetPage(
      name: AdminRoutes.deletedAccounts,
      page: () => DeletedAccountsScreen(),
      binding: DeletedAccountsBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Our Trusted Partners
    GetPage(
      name: AdminRoutes.trustedPartners,
      page: () => AllPartners(),
      binding: PartnersBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editPartners,
      page: () => EditPartners(),
      binding: PartnersBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createPartners,
      page: () => CreatePartners(),
      binding: PartnersBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Course
    GetPage(
      name: AdminRoutes.course,
      page: () => CourseList(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createCourse,
      page: () => CreateCourse(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editCourse,
      page: () => EditCourseScreen(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cCurriculum,
      page: () => CourseCurriculums(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cCreateCurriculum,
      page: () => CreateCourseCurriculum(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cEditCurriculum,
      page: () => EditCourseCurriculum(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cFaq,
      page: () => CourseAllFaqScreen(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cCreateFaq,
      page: () => CourseCreateFaqScreen(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cEditFaq,
      page: () => CourseEditFaqScreen(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cTestimonials,
      page: () => CourseAllTestimonialsScreen(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cCreateTestimonial,
      page: () => CourseCreateTestimonialScreen(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cEditTestimonial,
      page: () => CourseEditTestimonialScreen(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cLessons,
      page: () => LessonList(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cCreateLesson,
      page: () => CreateLessonScreen(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cEditLesson,
      page: () => EditLessonScreen(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.cBuy,
      page: () => CoursePayments(),
      binding: CourseBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Coupon
    GetPage(
      name: AdminRoutes.couponCode,
      page: () => AllCoupons(),
      binding: CouponBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createCouponCode,
      page: () => CreateCoupon(),
      binding: CouponBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editCouponCode,
      page: () => EditCouponScreen(),
      binding: CouponBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Blog
    GetPage(
      name: AdminRoutes.blog,
      page: () => AllBlogsScreen(),
      binding: BlogBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createBlog,
      page: () => CreateBlogScreen(),
      binding: BlogBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editBlog,
      page: () => EditBlogScreen(),
      binding: BlogBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Newsletter
    GetPage(
      name: AdminRoutes.newsLetter,
      page: () => Newsletter(),
      binding: NewsletterBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createNewsLetter,
      page: () => CreateNewsletterScreen(),
      binding: NewsletterBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Instructors
    GetPage(
      name: AdminRoutes.instructors,
      page: () => AllInstructors(),
      binding: InstructorBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createInstructor,
      page: () => CreateInstructorScreen(),
      binding: InstructorBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editInstructor,
      page: () => EditInstructorScreen(),
      binding: InstructorBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Legality
    GetPage(
      name: AdminRoutes.termsConditions,
      page: () => TermsConditionDesktopScreen(),
      binding: LegalityBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.privacyPolicy,
      page: () => PrivacyPolicyDesktopScreen(),
      binding: LegalityBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.refundPolicy,
      page: () => RefundPolicyDesktopScreen(),
      binding: LegalityBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.aboutUs,
      page: () => AboutUsDesktopScreen(),
      binding: LegalityBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Users
    GetPage(
      name: AdminRoutes.users,
      page: () => UsersScreen(),
      binding: UsersBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Settings
    GetPage(
      name: AdminRoutes.settings,
      page: () => SettingsScreen(),
      binding: SettingsBinding(),
      middlewares: [RoutesMiddleware()],
    ),
  ];
}
