import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
