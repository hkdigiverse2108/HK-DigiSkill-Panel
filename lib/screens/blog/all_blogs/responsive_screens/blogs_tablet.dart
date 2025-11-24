// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hkdigiskill_admin/routes/routes.dart';
// import 'package:hkdigiskill_admin/screens/blog/all_blogs/controllers/blogs_controller.dart';
// import 'package:hkdigiskill_admin/screens/blog/all_blogs/table/data_table.dart';
// import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
// import 'package:hkdigiskill_admin/widgets/admin_header.dart';
// import 'package:hkdigiskill_admin/widgets/custom_button.dart';
//
// class BlogsTabletScreen extends StatelessWidget {
//   const BlogsTabletScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BlogsController>();
//
//     return Obx(() {
//       return SingleChildScrollView(
//         padding: const EdgeInsets.all(AdminSizes.defaultSpace),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AdminHeader(
//               title: 'Blogs',
//               subtitle: 'Manage your blog posts',
//               action: CustomButton(
//                 text: 'Add New Blog',
//                 onPressed: () => Get.toNamed(AdminRoutes.createBlog),
//                 small: true,
//               ),
//             ),
//             const SizedBox(height: AdminSizes.spaceBtwSections),
//             // For tablet, we can still use the data table but with adjusted column sizes
//             ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 1000),
//               child: const BlogsTable(),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
