import 'package:get/get.dart';
import 'package:hkdigiskill_admin/bindings/banners_binding.dart';
import 'package:hkdigiskill_admin/bindings/category_binding.dart';
import 'package:hkdigiskill_admin/bindings/coupon_binding.dart';
import 'package:hkdigiskill_admin/bindings/course_binding.dart';
import 'package:hkdigiskill_admin/bindings/deleted_accounts_binding.dart';
import 'package:hkdigiskill_admin/bindings/faq_binding.dart';
import 'package:hkdigiskill_admin/bindings/gallery_binding.dart';
import 'package:hkdigiskill_admin/bindings/get_in_touch_binding.dart';
import 'package:hkdigiskill_admin/bindings/login_binding.dart';
import 'package:hkdigiskill_admin/bindings/media_binding.dart';
import 'package:hkdigiskill_admin/bindings/otp_binding.dart';
import 'package:hkdigiskill_admin/bindings/partners_binding.dart';
import 'package:hkdigiskill_admin/bindings/testimonials_binding.dart';
import 'package:hkdigiskill_admin/bindings/workshop_binding.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/routes/routes_middleware.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/all_banners.dart';
import 'package:hkdigiskill_admin/screens/banners/create_banner/create_banner.dart';
import 'package:hkdigiskill_admin/screens/banners/edit_banner/edit_banner.dart';
import 'package:hkdigiskill_admin/screens/category/all_category/category.dart';
import 'package:hkdigiskill_admin/screens/category/create_category/create_category.dart';
import 'package:hkdigiskill_admin/screens/category/edit_category/edit_category.dart';
import 'package:hkdigiskill_admin/screens/coupon/all_coupons/all_coupons.dart';
import 'package:hkdigiskill_admin/screens/coupon/create_coupon/create_coupon.dart';
// import 'package:hkdigiskill_admin/screens/coupon/create_coupon/create_coupon.dart';
import 'package:hkdigiskill_admin/screens/course/faq/all_faq/all_faq.dart';
import 'package:hkdigiskill_admin/screens/course/faq/create_faq/create_faq.dart';
import 'package:hkdigiskill_admin/screens/course/faq/edit_faq/edit_faq.dart';
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
import 'package:hkdigiskill_admin/screens/login/login_page.dart';
import 'package:hkdigiskill_admin/screens/media/media.dart';
import 'package:hkdigiskill_admin/screens/otp/otp.dart';
import 'package:hkdigiskill_admin/screens/our_trusted_partners/all_partners/all_partners.dart';
import 'package:hkdigiskill_admin/screens/reset_password/reset_password.dart';
import 'package:hkdigiskill_admin/screens/testimonials/all_testimonials/all_testimonials.dart';
import 'package:hkdigiskill_admin/screens/testimonials/create_testimonial/create_testimonial.dart';
import 'package:hkdigiskill_admin/screens/testimonials/edit_testimonial/edit_testimonial.dart';
import 'package:hkdigiskill_admin/screens/transactions/transactions.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/all_workshop.dart';
import 'package:hkdigiskill_admin/screens/workshop/create_workshop/create_workshop.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/all_faq/all_faq.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/create_faq/create_faq.dart';
import 'package:hkdigiskill_admin/screens/workshop/faq/edit_faq/edit_faq.dart';

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
    GetPage(
      name: AdminRoutes.transactions,
      page: () => TransactionsScreen(),
      middlewares: [RoutesMiddleware()],
    ),

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
    // GetPage(
    //   name: AdminRoutes.editWorkshop,
    //   page: () => EditWorkshopScreen(),
    //   binding: WorkshopBinding(),
    //   middlewares: [RoutesMiddleware()],
    // ),
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

    // Course Faq
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
    // GetPage(
    //   name: AdminRoutes.editCouponCode,
    //   page: () => EditCoupon(),
    //   binding: CouponBinding(),
    //   middlewares: [RoutesMiddleware()],
    // ),
  ];
}
