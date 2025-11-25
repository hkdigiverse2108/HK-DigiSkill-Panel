import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class ApiConstants {
  static const String baseUrl = 'http://localhost:5555';

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
  static const String categoryDelete = '/course-category';

  // Get In Touch
  static const String getInTouch = '/get-in-touch/all';
  static const String getInTouchUpdate = '/get-in-touch/edit';
  static const String getInTouchDelete = '/get-in-touch/delete';

  // FAQ
  static String faqWithType(FaqType type) => '/faq/all?type=${type.name}';
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
  static const String mediaDelete = '/upload';
  static const String mediaUpload = '/upload';
}
