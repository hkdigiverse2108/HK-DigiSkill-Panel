import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/blog_model.dart';
import 'package:hkdigiskill_admin/screens/blog/all_blogs/controllers/blogs_controller.dart';

class EditBlogController extends GetxController {
  static EditBlogController get instance => Get.find();

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
  late BlogModel blog;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Get the blog data from arguments
    final args = Get.arguments;
    if (args is BlogModel) {
      blog = args;
      loadBlogData();
    } else {
      Get.back();
      Get.snackbar('Error', 'Invalid blog data');
    }
  }

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

  void loadBlogData() {
    titleController.text = blog.title;
    if (blog.subtitle != null) {
      subtitleController.text = blog.subtitle!;
    }
    contentController.text = blog.content;
    if (blog.quote != null) {
      quoteController.text = blog.quote!;
    }
    authorNameController.text = blog.authorName;
    dateController.text = blog.date.toIso8601String().split('T')[0];
    isFeatured.value = blog.isFeatured;
    coverImage = blog.coverImage;
    mainImage = blog.mainImage;
  }

  Future<void> onPickCoverImage() async {
    // TODO: Implement image picker for cover image
    // For now, using a placeholder
    coverImage =
        'https://example.com/cover_${DateTime.now().millisecondsSinceEpoch}.jpg';
    update();
  }

  Future<void> onPickMainImage() async {
    // TODO: Implement image picker for main image
    // For now, using a placeholder
    mainImage =
        'https://example.com/main_${DateTime.now().millisecondsSinceEpoch}.jpg';
    update();
  }

  Future<void> updateBlog() async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;

      final updatedBlog = blog.copyWith(
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

      // Update in the list in BlogsController
      final blogsController = Get.find<BlogsController>();
      final index = blogsController.dataList.indexWhere((b) => b.id == blog.id);
      if (index != -1) {
        blogsController.dataList[index] = updatedBlog;
        blogsController.filterData();
      }

      Get.back();
      Get.snackbar('Success', 'Blog updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update blog: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
