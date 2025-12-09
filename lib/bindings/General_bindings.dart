import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/screens/settings/controllers/settings_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkManager>(() => NetworkManager(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
  }
}
