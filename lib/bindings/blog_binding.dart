import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/blog/all_blogs/controllers/blogs_controller.dart';
import 'package:hkdigiskill_admin/screens/blog/create_blog/controllers/create_blog_controller.dart';
import 'package:hkdigiskill_admin/screens/blog/edit_blog/controllers/edit_blog_controller.dart';

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BlogsController());
    Get.lazyPut(() => CreateBlogController());
    Get.lazyPut(() => EditBlogController());
  }
}
