import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/image_model.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  Rx<String?> selectedThumbnailImageUrl = Rx<String?>(null);

  final RxList<String> selectedImagesUrls = <String>[].obs;

  void selectThumbnailImage() async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia();

    // Handle the selected images
    if (selectedImages != null && selectedImages.isNotEmpty) {
      ImageModel selectedImage = selectedImages.first;

      selectedThumbnailImageUrl.value = selectedImage.url;
    }
  }

  void selectMultipleImages(List<String> urls) async {
    final controller = Get.put(MediaController());
    List<ImageModel>? selectedImages = await controller.selectImagesFromMedia(
      allowMultipleSelection: true,
      selectedUrls: selectedImagesUrls,
    );

    if (selectedImages != null && selectedImages.isNotEmpty) {
      selectedImagesUrls.assignAll(selectedImages.map((e) => e.url));
    }
  }

  Future<void> removeImage(int index) async {
    selectedImagesUrls.removeAt(index);
  }
}
