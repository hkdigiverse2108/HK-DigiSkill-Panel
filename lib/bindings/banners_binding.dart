import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/banners/all_banners/controllers/banners_controller.dart';
import 'package:hkdigiskill_admin/screens/banners/create_banner/controllers/create_banner_controller.dart';
import 'package:hkdigiskill_admin/screens/banners/edit_banner/controllers/edit_banner_controller.dart';

class BannersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BannersController());
    Get.lazyPut(() => CreateBannerController());
    Get.lazyPut(() => EditBannerController());
  }
}
