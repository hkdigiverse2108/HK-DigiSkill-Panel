import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/settings/controllers/settings_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:iconsax/iconsax.dart';

class MenuItem {
  final String title;
  final String route;
  final IconData? icon;
  final List<MenuItem>? children;

  MenuItem({
    required this.title,
    required this.route,
    this.icon,
    this.children,
  });

  // Convert all menu items to a flat list for searching
  static List<MenuItem> getAllItems() {
    return [
      MenuItem(
        title: 'Dashboard',
        route: AdminRoutes.dashboard,
        icon: Iconsax.status,
      ),
      MenuItem(title: 'Media', route: AdminRoutes.media, icon: Iconsax.image),
      MenuItem(
        title: 'Category',
        route: AdminRoutes.category,
        icon: Iconsax.document,
      ),
      MenuItem(
        title: 'Workshops',
        route: AdminRoutes.wWorkshops,
        icon: Iconsax.monitor_recorder,
      ),
      MenuItem(
        title: 'Workshop Curriculum',
        route: AdminRoutes.wCurriculum,
        icon: Iconsax.book,
      ),
      MenuItem(
        title: 'Workshop Testimonials',
        route: AdminRoutes.wTestimonials,
        icon: Iconsax.message,
      ),
      MenuItem(
        title: 'Workshop FAQ',
        route: AdminRoutes.wFaq,
        icon: Iconsax.message_question,
      ),
      MenuItem(
        title: 'Workshop Buy',
        route: AdminRoutes.wBuy,
        icon: Iconsax.shopping_cart,
      ),
      MenuItem(
        title: 'Courses',
        route: AdminRoutes.cCourses,
        icon: Iconsax.book_square,
      ),
      MenuItem(
        title: 'Lessons',
        route: AdminRoutes.cLessons,
        icon: Iconsax.video_play,
      ),
      MenuItem(
        title: 'Course Curriculum',
        route: AdminRoutes.cCurriculum,
        icon: Iconsax.book,
      ),
      MenuItem(
        title: 'Course Testimonials',
        route: AdminRoutes.cTestimonials,
        icon: Iconsax.message,
      ),
      MenuItem(
        title: 'Course FAQ',
        route: AdminRoutes.cFaq,
        icon: Iconsax.message_question,
      ),
      MenuItem(
        title: 'Course Buy',
        route: AdminRoutes.cBuy,
        icon: Iconsax.shopping_cart,
      ),
      MenuItem(
        title: 'Coupon Code',
        route: AdminRoutes.couponCode,
        icon: Iconsax.discount_shape,
      ),
      MenuItem(
        title: 'Deleted Accounts',
        route: AdminRoutes.deletedAccounts,
        icon: Iconsax.trash,
      ),
      MenuItem(
        title: 'Our Trusted Partners',
        route: AdminRoutes.trustedPartners,
        icon: Iconsax.people,
      ),
      MenuItem(
        title: 'FAQ',
        route: AdminRoutes.faq,
        icon: Iconsax.message_question,
      ),
      MenuItem(
        title: 'Testimonials',
        route: AdminRoutes.testimonials,
        icon: Iconsax.message,
      ),
      MenuItem(
        title: 'Instructors',
        route: AdminRoutes.instructors,
        icon: Iconsax.user_tag,
      ),
      MenuItem(title: 'Blog', route: AdminRoutes.blog, icon: Iconsax.user_tag),
      MenuItem(
        title: 'Get in touch',
        route: AdminRoutes.getInTouch,
        icon: Iconsax.message_circle,
      ),
      MenuItem(
        title: 'Gallery',
        route: AdminRoutes.gallery,
        icon: Iconsax.image,
      ),
      MenuItem(
        title: 'Newsletter',
        route: AdminRoutes.newsLetter,
        icon: Iconsax.send_2,
      ),
      MenuItem(
        title: 'Banners',
        route: AdminRoutes.banners,
        icon: Iconsax.image,
      ),
      MenuItem(
        title: 'About Us',
        route: AdminRoutes.aboutUs,
        icon: Iconsax.document,
      ),
      MenuItem(
        title: 'Privacy Policy',
        route: AdminRoutes.privacyPolicy,
        icon: Iconsax.lock,
      ),
      MenuItem(
        title: 'Refund Policy',
        route: AdminRoutes.refundPolicy,
        icon: Iconsax.money,
      ),
      MenuItem(
        title: 'Terms & Conditions',
        route: AdminRoutes.termsConditions,
        icon: Iconsax.document_text,
      ),
      MenuItem(
        title: 'Settings',
        route: AdminRoutes.settings,
        icon: Iconsax.user_tag,
      ),
    ];
  }

  // Get all items including children as a flat list
  static List<MenuItem> getFlatItems() {
    List<MenuItem> allItems = [];
    for (var item in getAllItems()) {
      allItems.add(item);
      if (item.children != null) {
        allItems.addAll(item.children!);
      }
    }
    return allItems;
  }
}

class _MenuSearchDelegate extends SearchDelegate<String> {
  final List<MenuItem> menuItems;

  _MenuSearchDelegate({required this.menuItems});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = menuItems
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          leading: item.icon != null ? Icon(item.icon) : null,
          title: Text(item.title),
          onTap: () {
            Get.toNamed(item.route);
            close(context, item.title);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? []
        : menuItems
        .where(
          (item) =>
          item.title.toLowerCase().contains(query.toLowerCase()),
    )
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final item = suggestions[index];
        return ListTile(
          leading: item.icon != null ? Icon(item.icon) : null,
          title: Text(item.title),
          onTap: () {
            close(context, item.title);
            Future.microtask(() => Get.toNamed(item.route));
          },
        );
      },
    );
  }
}

class AdminHeader extends StatelessWidget implements PreferredSizeWidget {
  final List<MenuItem> menuItems;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const AdminHeader({super.key, this.menuItems = const [], this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final store = AdminStorageService();
    return Container(
      decoration: BoxDecoration(
        color: AdminHelperFunctions.isDarkMode(context)
            ? AdminColors.black
            : AdminColors.white,
        border: Border(bottom: BorderSide(color: AdminColors.grey, width: 1)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: AdminSizes.md,
        vertical: AdminSizes.sm,
      ),
      child: AppBar(
        scrolledUnderElevation: 0,
        leading: !AdminDeviceUtility.isDesktopScreen(context)
            ? IconButton(
          onPressed: () => scaffoldKey?.currentState?.openDrawer(),
          icon: const Icon(Iconsax.menu, fill: 0.0),
        )
            : null,
        automaticallyImplyLeading: false,
        title: AdminDeviceUtility.isDesktopScreen(context)
            ? SizedBox(
          width: 400,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Search anything....",
              prefixIcon: const Icon(Iconsax.search_normal, fill: 0.0),
            ),
            onFieldSubmitted: (value) {
              // open search delegate
              showSearch(
                context: context,
                delegate: _MenuSearchDelegate(
                  menuItems: menuItems.isNotEmpty
                      ? menuItems
                      : MenuItem.getFlatItems(),
                ),
                query: value,
              );
            },
          ),
        )
            : null,
        actions: [
          if (!AdminDeviceUtility.isDesktopScreen(context))
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: _MenuSearchDelegate(
                    menuItems: menuItems.isNotEmpty
                        ? menuItems
                        : MenuItem.getFlatItems(),
                  ),
                );
              },
              icon: const Icon(Iconsax.search_normal, fill: 0.0),
            ),
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.notification, fill: 0.0),
          ),
          const SizedBox(width: AdminSizes.spaceBtwItems / 2),

          // User Data
          Row(
            children: [
              Obx(
                    () =>
                    AdminRoundedImage(
                      imageType: ImageType.network,
                      image:
                      SettingsController.instance.logo.value ??
                          AdminImages.profile,
                      width: 40,
                      height: 40,
                      padding: 2,
                    ),
              ),
              Gap(AdminSizes.sm),
              if (!AdminDeviceUtility.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      store.user?['email'].split('@')[0] ?? "Admin",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                    Text(
                      store.user?['email'] ?? "Admin@gmail.com",
                      style: Theme
                          .of(context)
                          .textTheme
                          .labelMedium,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(AdminDeviceUtility.getAppBarHeight() + 15);
}
