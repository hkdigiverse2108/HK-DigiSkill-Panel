import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkManager>(() => NetworkManager(), fenix: true);
  }
}
