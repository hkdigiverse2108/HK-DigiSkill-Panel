import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/sidebars/controllers/sidebar_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class AdminMenuItem extends StatefulWidget {
  const AdminMenuItem({
    super.key,
    required this.route,
    required this.title,
    required this.icon,
    this.subItems,
  });

  final String route;
  final String title;
  final IconData icon;
  final List<AdminMenuItem>? subItems; // ✅ Optional nested menu items

  @override
  State<AdminMenuItem> createState() => _AdminMenuItemState();
}

class _AdminMenuItemState extends State<AdminMenuItem> {
  final manuController = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (widget.subItems != null && widget.subItems!.isNotEmpty) {
                // Toggle expansion for items with children
                manuController.toggleExpand(widget.route);
              } else {
                manuController.menuOnTap(widget.route);
              }
            },
            onHover: (hovering) => hovering
                ? manuController.changeHoverItem(widget.route)
                : manuController.changeHoverItem(''),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AdminSizes.xs),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      manuController.isHovering(widget.route) ||
                          manuController.isActive(widget.route)
                      ? AdminColors.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(AdminSizes.cardRadiusMd),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Icon
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AdminSizes.lg,
                        top: AdminSizes.md,
                        bottom: AdminSizes.md,
                        right: AdminSizes.md,
                      ),
                      child: Icon(
                        widget.icon,
                        size: 22,
                        color:
                            manuController.isActive(widget.route) ||
                                manuController.isHovering(widget.route)
                            ? AdminColors.white
                            : AdminColors.darkGrey,
                      ),
                    ),

                    // Title
                    Expanded(
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color:
                              manuController.isActive(widget.route) ||
                                  manuController.isHovering(widget.route)
                              ? AdminColors.white
                              : AdminColors.darkGrey,
                        ),
                      ),
                    ),

                    // Expand arrow if sub-items exist
                    if (widget.subItems != null && widget.subItems!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: AdminSizes.sm),
                        child: Icon(
                          manuController.isExpanded(widget.route)
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                          size: 18,
                          color: manuController.isActive(widget.route)
                              ? AdminColors.white
                              : AdminColors.darkGrey,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          // Submenu items (visible when expanded)
          if (widget.subItems != null &&
              widget.subItems!.isNotEmpty &&
              manuController.isExpanded(widget.route))
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                children: widget.subItems!.map((subItem) {
                  // Pass the parent route to sub-items
                  return Builder(
                    builder: (context) => subItem,
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
