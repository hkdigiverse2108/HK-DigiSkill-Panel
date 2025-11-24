import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/blog_model.dart';
import 'package:hkdigiskill_admin/screens/blog/all_blogs/controllers/blogs_controller.dart';

class CreateBlogController extends GetxController {
  static CreateBlogController get instance => Get.find();

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  final contentController = TextEditingController();
  final quoteController = TextEditingController();
  final authorNameController = TextEditingController();
  final dateController = TextEditingController();
  final isFeatured = false.obs;
  String coverImage = '';
  String mainImage = '';

  final isLoading = false.obs;

  @override
  void onClose() {
    titleController.dispose();
    subtitleController.dispose();
    contentController.dispose();
    quoteController.dispose();
    authorNameController.dispose();
    dateController.dispose();
    super.onClose();
  }

  Future<void> onPickCoverImage() async {
    // TODO: Implement image picker for cover image
    // For now, using a placeholder
    coverImage =
        'https://example.com/cover_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  Future<void> onPickMainImage() async {
    // TODO: Implement image picker for main image
    // For now, using a placeholder
    mainImage =
        'https://example.com/main_${DateTime.now().millisecondsSinceEpoch}.jpg';
  }

  Future<void> createBlog() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      final newBlog = BlogModel(
        id: DateTime.now().millisecondsSinceEpoch,
        title: titleController.text.trim(),
        subtitle: subtitleController.text.trim().isNotEmpty
            ? subtitleController.text.trim()
            : null,
        content: contentController.text.trim(),
        quote: quoteController.text.trim().isNotEmpty
            ? quoteController.text.trim()
            : null,
        authorName: authorNameController.text.trim(),
        date: dateController.text.isNotEmpty
            ? DateTime.parse(dateController.text)
            : DateTime.now(),
        isFeatured: isFeatured.value,
        coverImage: coverImage,
        mainImage: mainImage,
      );

      // TODO: Replace with actual API call
      await Future.delayed(const Duration(seconds: 1));

      // Add to the list in BlogsController
      final blogsController = Get.find<BlogsController>();
      blogsController.dataList.add(newBlog);
      blogsController.filterData();

      Get.back();
      Get.snackbar('Success', 'Blog created successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to create blog: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
