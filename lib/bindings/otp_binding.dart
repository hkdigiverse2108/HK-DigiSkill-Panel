import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/otp/controllers/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
