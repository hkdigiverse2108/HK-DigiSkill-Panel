// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hkdigiskill_admin/routes/routes.dart';
// import 'package:hkdigiskill_admin/screens/blog/all_blogs/controllers/blogs_controller.dart';
// import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
// import 'package:hkdigiskill_admin/widgets/admin_header.dart';
// import 'package:hkdigiskill_admin/widgets/custom_button.dart';
// import 'package:hkdigiskill_admin/widgets/loading_indicator.dart';
// import 'package:intl/intl.dart';
//
// class BlogsMobileScreen extends StatelessWidget {
//   const BlogsMobileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<BlogsController>();
//
//     return Obx(() {
//       if (controller.isLoading.value) {
//         return const Center(child: LoadingIndicator());
//       }
//
//       return SingleChildScrollView(
//         padding: const EdgeInsets.all(AdminSizes.defaultSpace),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AdminHeader(
//               title: 'Blogs',
//               subtitle: 'Manage your blog posts',
//               action: CustomButton(
//                 text: 'Add New',
//                 onPressed: () => Get.toNamed(AdminRoutes.createBlog),
//                 small: true,
//               ),
//             ),
//             const SizedBox(height: AdminSizes.spaceBtwSections),
//             ...controller.filteredDataList.map((blog) => _buildBlogCard(blog)).toList(),
//           ],
//         ),
//       );
//     });
//   }
//
//   Widget _buildBlogCard(BlogModel blog) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: AdminSizes.spaceBtwItems),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(AdminSizes.md),
//         title: Text(
//           blog.title,
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             if (blog.subtitle != null) Text(blog.subtitle!),
//             const SizedBox(height: 4),
//             Text(
//               'By ${blog.authorName} • ${DateFormat('MMM d, y').format(blog.date)}',
//               style: Theme.of(Get.context!).textTheme.bodySmall,
//             ),
//           ],
//         ),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: Icon(
//                 blog.isFeatured ? Icons.star : Icons.star_border,
//                 color: blog.isFeatured ? Colors.amber : null,
//               ),
//               onPressed: () {
//                 // Toggle featured status
//                 Get.find<BlogsController>().toggleFeatured(blog.id, !blog.isFeatured);
//               },
//             ),
//             PopupMenuButton(
//               itemBuilder: (context) => [
//                 const PopupMenuItem(
//                   value: 'edit',
//                   child: Text('Edit'),
//                 ),
//                 const PopupMenuItem(
//                   value: 'delete',
//                   child: Text('Delete', style: TextStyle(color: Colors.red)),
//                 ),
//               ],
//               onSelected: (value) {
//                 if (value == 'edit') {
//                   Get.toNamed(AdminRoutes.editBlog, arguments: blog);
//                 } else if (value == 'delete') {
//                   Get.find<BlogsController>().deleteItem(blog.id);
//                 }
//               },
//             ),
//           ],
//         ),
//         onTap: () {
//           // Navigate to edit screen on tap
//           Get.toNamed(AdminRoutes.editBlog, arguments: blog);
//         },
//       ),
//     );
//   }
// }
