import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/images/circular_image.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/sidebars/menu/menu_item.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/util/constants/colors.dart';
import 'package:hkdigiskill_admin/util/constants/enum.dart';
import 'package:hkdigiskill_admin/util/constants/image_strings.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';
import 'package:hkdigiskill_admin/util/helpers/helpers.dart';
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
              ? AdminColors.black
              : AdminColors.white,
          border: Border(right: BorderSide(color: AdminColors.grey, width: 1)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // image
              AdminCircularImage(
                imageType: ImageType.network,
                image: AdminImages.profile,
                width: 100,
                height: 100,
                backgroundColor: Colors.transparent,
              ),
              Gap(AdminSizes.spaceBtwSections),
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
                      route: AdminRoutes.login,
                      title: 'Login',
                      icon: Iconsax.login,
                    ),
                    AdminMenuItem(
                      route: AdminRoutes.dashboard,
                      title: 'Dashboard',
                      icon: Iconsax.status,
                    ),
                    AdminMenuItem(
                      route: AdminRoutes.forgotPassword,
                      title: 'Forgot Password',
                      icon: Iconsax.password_check,
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
