import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/sidebars/controllers/sidebar_controller.dart';
import 'package:hkdigiskill_admin/util/constants/colors.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AdminMenuItem extends StatelessWidget {
  const AdminMenuItem({
    super.key,
    required this.route,
    required this.title,
    required this.icon,
  });

  final String route;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final manuController = Get.put(SidebarController());
    return InkWell(
      onTap: () => manuController.menuOnTap(route),
      onHover: (hovering) => hovering
          ? manuController.changeHoverItem(route)
          : manuController.changeHoverItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: AdminSizes.xs),
          child: Container(
            decoration: BoxDecoration(
              color:
                  manuController.isHovering(route) ||
                      manuController.isActive(route)
                  ? AdminColors.primary
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(AdminSizes.cardRadiusMd),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: AdminSizes.lg,
                    top: AdminSizes.md,
                    bottom: AdminSizes.md,
                    right: AdminSizes.md,
                  ),
                  child: manuController.isActive(route)
                      ? Icon(icon, size: 22, color: AdminColors.white)
                      : Icon(
                          icon,
                          size: 22,
                          color: manuController.isHovering(route)
                              ? AdminColors.white
                              : AdminColors.darkGrey,
                        ),
                ),

                // Text
                if (manuController.isHovering(route) ||
                    manuController.isActive(route))
                  Flexible(
                    child: Text(
                      title,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: AdminColors.white),
                    ),
                  )
                else
                  Flexible(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: AdminColors.darkGrey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
