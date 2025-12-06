import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/legality/about_us/controllers/about_us_controller.dart';
import 'package:hkdigiskill_admin/screens/legality/privacy_policy/controllers/privacy_policy_controller.dart';
import 'package:hkdigiskill_admin/screens/legality/refund_policy/controllers/refund_policy_controller.dart';
import 'package:hkdigiskill_admin/screens/legality/terms_condition/controllers/terms_condition_controller.dart';

class LegalityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TermsConditionController());
    Get.lazyPut(() => RefundPolicyController());
    Get.lazyPut(() => PrivacyPolicyController());
    Get.lazyPut(() => AboutUsController());
  }
}
