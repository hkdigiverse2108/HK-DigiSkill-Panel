import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:iconsax/iconsax.dart';

class AdminHeader extends StatelessWidget implements PreferredSizeWidget {
  const AdminHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
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
                ),
              )
            : null,
        actions: [
          if (!AdminDeviceUtility.isDesktopScreen(context))
            IconButton(
              onPressed: () {},
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
              AdminRoundedImage(
                imageType: ImageType.network,
                image: AdminImages.profile,
                width: 40,
                height: 40,
                padding: 2,
              ),
              Gap(AdminSizes.sm),
              if (!AdminDeviceUtility.isMobileScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Admin",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Admin@gmail.com",
                      style: Theme.of(context).textTheme.labelMedium,
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
