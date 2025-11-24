import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/gallery/all_gallery/controllers/gallery_controller.dart';
import 'package:hkdigiskill_admin/screens/gallery/create_gallery/controllers/create_gallery_controller.dart';
import 'package:hkdigiskill_admin/screens/gallery/edit_gallery/controllers/edit_gallery_controller.dart';

class GalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GalleryController());
    Get.lazyPut(() => CreateGalleryController());
    Get.lazyPut(() => EditGalleryController());
  }
}
