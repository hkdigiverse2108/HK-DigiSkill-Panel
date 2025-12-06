import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class ApiConstants {
  static const String baseUrl = String.fromEnvironment("API_URL");

  // Auth
  static const String login = '/auth/login';
  static const String otpVerify = '/auth/otp/verify';
  static const String resendOtp = '/auth/resend-otp';
  static const String changePassword = '/auth/change-password';
  static const String updateProfile = '/auth/update-profile';

  // Category
  static const String category = '/course-category/all';
  static const String categoryCreate = '/course-category/add';
  static const String categoryUpdate = '/course-category/edit';
  static const String categoryDelete = '/course-category/delete';

  // Get In Touch
  static const String getInTouch = '/get-in-touch/all';
  static const String getInTouchUpdate = '/get-in-touch/edit';
  static const String getInTouchDelete = '/get-in-touch/delete';

  // Workshop
  static const String workshop = '/workshop/all';
  static const String workshopCreate = '/workshop/add';
  static const String workshopUpdate = '/workshop/edit';
  static const String workshopDelete = '/workshop/delete';
  static const String workshopCurriculums = '/workshop-curriculum/all';
  static const String workshopCurriculumsCreate = '/workshop-curriculum/add';
  static const String workshopCurriculumsUpdate = '/workshop-curriculum/edit';
  static const String workshopCurriculumsDelete = '/workshop-curriculum/delete';
  static const String workshopPayments = '/workshop/my-workshops';

  // Course
  static const String course = '/course/all';
  static const String courseCreate = '/course/add';
  static const String courseUpdate = '/course/update';
  static const String courseDelete = '/course/delete';
  static const String courseCurriculums = '/course-curriculum/all';
  static const String courseCurriculumsCreate = '/course-curriculum/add';
  static const String courseCurriculumsUpdate = '/course-curriculum/edit';
  static const String courseCurriculumsDelete = '/course-curriculum/delete';
  static const String courseLessonList = '/course-lesson/all';
  static const String courseLessonCreate = '/course-lesson/add';
  static const String courseLessonUpdate = '/course-lesson/edit';
  static const String courseLessonDelete = '/course-lesson/delete';
  static const String lessonByCourseId = '/course-lesson/all?courseId=';
  static const String coursePayments = '/course/my-courses';

  // FAQ
  static String faqWithType(DashType type) => '/faq/all?type=${type.name}';
  static const String faqCreate = '/faq/add';
  static const String faqUpdate = '/faq/edit';
  static const String faqDelete = '/faq/delete';

  // Coupon
  static const String coupon = '/coupon-code/all';
  static const String couponCreate = '/coupon-code/add';
  static const String couponUpdate = '/coupon-code/edit';
  static const String couponDelete = '/coupon-code/delete';

  // media
  static const String media = '/upload/images';
  static const String mediaPdf = '/upload/pdf';
  static const String mediaDelete = '/upload';
  static const String mediaUpload = '/upload';

  // Banner
  static const String banner = '/hero-banner/all';
  static const String bannerCreate = '/hero-banner/add';
  static const String bannerUpdate = '/hero-banner/edit';
  static const String bannerDelete = '/hero-banner/delete';

  // Partner
  static const String partner = '/trusted-partner/all';
  static const String partnerCreate = '/trusted-partner/add';
  static const String partnerUpdate = '/trusted-partner/edit';
  static const String partnerDelete = '/trusted-partner/delete';

  // testimonials
  static String testimonials(DashType type) =>
      '/testimonial/all?type=${type.name}';
  static const String testimonialsCreate = '/testimonial/add';
  static const String testimonialsUpdate = '/testimonial/edit';
  static const String testimonialsDelete = '/testimonial/delete';

  // Blog
  static const String blog = '/blog/all';
  static const String blogCreate = '/blog/add';
  static const String blogUpdate = '/blog/edit';
  static const String blogDelete = '/blog/delete';

  // Gallery
  static const String gallery = '/gallery/all';
  static const String galleryCreate = '/gallery/add';
  static const String galleryUpdate = '/gallery/edit';
  static const String galleryDelete = '/gallery/delete';

  // Instructors
  static const String instructorList = '/instructor/all';
  static const String instructorCreate = '/instructor/add';
  static const String instructorUpdate = '/instructor/edit';
  static const String instructorDelete = '/instructor/delete';

  // Newsletter
  static const String newsletterList = '/newsletter/all';
  static const String newsletterCreate = '/newsletter/add';
  static const String newsletterUpdate = '/newsletter/edit';
  static const String newsletterDelete = '/newsletter/delete';

  // Users
  static const String users = '/user/all';
  static const String usersDelete = '/user/delete/';
  static const String deletedAccounts = '/user/delete/all';

  // Legality
  static const String legalityFetch = '/legality?typeFilter=';
  static const String legalityUpdate = '/legality/add';
  static const String legalityAboutUs = '/about-us';
  static const String aboutUsUpdate = '/about-us/add/edit';

  // Settings
  static const String settings = '/settings/all';
  static const String settingsUpdate = '/settings/add-edit';
}
