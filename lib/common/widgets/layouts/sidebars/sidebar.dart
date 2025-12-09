import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/images/circular_image.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/settings/controllers/settings_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:iconsax/iconsax.dart';

class AdminSidebar extends StatelessWidget {
  const AdminSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        decoration: BoxDecoration(
          color: AdminHelperFunctions.isDarkMode(context)
              ? AdminColors.dark
              : AdminColors.white,
          border: Border(right: BorderSide(color: AdminColors.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Gap(AdminSizes.spaceBtwSections),
              // image
              Obx(
                () => AdminCircularImage(
                  imageType: ImageType.network,
                  image:
                      SettingsController.instance.logo.value ??
                      AdminImages.profile,
                  width: 100,
                  height: 100,
                  backgroundColor: Colors.transparent,
                ),
              ),
              // Gap(AdminSizes.spaceBtwSections),
              Padding(
                padding: EdgeInsetsGeometry.all(AdminSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MENU',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.apply(letterSpacingDelta: 1.2),
                    ),

                    // menu items
                    AdminMenuItem(
                      route: AdminRoutes.dashboard,
                      title: 'Dashboard',
                      icon: Iconsax.status,
                    ),
                    AdminMenuItem(
                      route: AdminRoutes.media,
                      title: 'Media',
                      icon: Iconsax.image,
                    ),
                    // AdminMenuItem(
                    //   route: AdminRoutes.transactions,
                    //   title: 'Transactions',
                    //   icon: Iconsax.wallet_2,
                    // ),
                    AdminMenuItem(
                      route: AdminRoutes.category,
                      title: 'Category',
                      icon: Iconsax.document,
                    ),
                    AdminMenuItem(
                      route: AdminRoutes.workshop,
                      title: 'Workshop',
                      icon: Iconsax.monitor,
                      subItems: const [
                        AdminMenuItem(
                          route: AdminRoutes.wWorkshops,
                          title: 'Workshops',
                          icon: Iconsax.monitor_recorder,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.wCurriculum,
                          title: 'Curriculum',
                          icon: Iconsax.book,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.wTestimonials,
                          title: 'Testimonials',
                          icon: Iconsax.message,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.wFaq,
                          title: 'FAQ',
                          icon: Iconsax.message_question,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.wBuy,
                          title: 'Buy Workshop',
                          icon: Iconsax.shopping_cart,
                        ),
                      ],
                    ),
                    AdminMenuItem(
                      route: AdminRoutes.course,
                      title: 'Course',
                      icon: Iconsax.book_1,
                      subItems: const [
                        AdminMenuItem(
                          route: AdminRoutes.cCourses,
                          title: 'Courses',
                          icon: Iconsax.book_square,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.cLessons,
                          title: 'Lessons',
                          icon: Iconsax.video_play,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.cCurriculum,
                          title: 'Curriculum',
                          icon: Iconsax.book,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.cTestimonials,
                          title: 'Testimonials',
                          icon: Iconsax.message,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.cFaq,
                          title: 'FAQ',
                          icon: Iconsax.message_question,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.cBuy,
                          title: 'Buy Courses',
                          icon: Iconsax.shopping_cart,
                        ),
                      ],
                    ),

                    /// ───────── General Sections ─────────
                    const AdminMenuItem(
                      route: AdminRoutes.couponCode,
                      title: 'Coupon Code',
                      icon: Iconsax.discount_shape,
                    ),
                    const AdminMenuItem(
                      route: AdminRoutes.deletedAccounts,
                      title: 'Deleted Accounts',
                      icon: Iconsax.trash,
                    ),
                    const AdminMenuItem(
                      route: AdminRoutes.trustedPartners,
                      title: 'Our Trusted Partners',
                      icon: Iconsax.people,
                    ),
                    const AdminMenuItem(
                      route: AdminRoutes.faq,
                      title: 'FAQ',
                      icon: Iconsax.message_question,
                    ),
                    const AdminMenuItem(
                      route: AdminRoutes.testimonials,
                      title: 'Testimonials',
                      icon: Iconsax.message,
                    ),
                    AdminMenuItem(
                      route: AdminRoutes.instructors,
                      title: 'Instructors',
                      icon: Iconsax.user_tag,
                    ),
                    // const AdminMenuItem(
                    //   route: AdminRoutes.adminUsers,
                    //   title: 'Admin Users',
                    //   icon: Iconsax.user_tag,
                    // ),
                    const AdminMenuItem(
                      route: AdminRoutes.blog,
                      title: 'Blog',
                      icon: Iconsax.note_2,
                    ),
                    const AdminMenuItem(
                      route: AdminRoutes.getInTouch,
                      title: 'Get In Touch',
                      icon: Iconsax.call,
                    ),
                    const AdminMenuItem(
                      route: AdminRoutes.gallery,
                      title: 'Gallery',
                      icon: Iconsax.gallery,
                    ),
                    const AdminMenuItem(
                      route: AdminRoutes.newsLetter,
                      title: 'News Letter',
                      icon: Iconsax.send_2,
                    ),
                    const AdminMenuItem(
                      route: AdminRoutes.banners,
                      title: 'Banners',
                      icon: Iconsax.image,
                    ),

                    /// ───────── Legality Section ─────────
                    AdminMenuItem(
                      route: AdminRoutes.legality,
                      title: 'Legality',
                      icon: Iconsax.security_safe,
                      subItems: const [
                        AdminMenuItem(
                          route: AdminRoutes.aboutUs,
                          title: 'About Us',
                          icon: Iconsax.document,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.privacyPolicy,
                          title: 'Privacy Policy',
                          icon: Iconsax.lock,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.refundPolicy,
                          title: 'Refund Policy',
                          icon: Iconsax.money,
                        ),
                        AdminMenuItem(
                          route: AdminRoutes.termsConditions,
                          title: 'Terms & Conditions',
                          icon: Iconsax.document_text,
                        ),
                      ],
                    ),

                    /// ───────── User Management ─────────
                    const AdminMenuItem(
                      route: AdminRoutes.users,
                      title: 'Users',
                      icon: Iconsax.user,
                    ),
                    const AdminMenuItem(
                      route: AdminRoutes.settings,
                      title: 'Settings',
                      icon: Iconsax.setting_2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
