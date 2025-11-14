import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class AdminRoundedContainer extends StatelessWidget {
  const AdminRoundedContainer({
    super.key,
    this.child,
    this.radius = AdminSizes.cardRadiusLg,
    this.width,
    this.height,
    this.showBorder = false,
    this.showShadow = true,
    this.backgroundColor = AdminColors.white,
    this.borderColor = AdminColors.borderPrimary,
    this.margin,
    this.padding = const EdgeInsets.all(AdminSizes.md),
    this.onTap,
  });

  final Widget? child;
  final double radius;
  final double? width;
  final double? height;
  final bool showBorder;
  final bool showShadow;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null,
          boxShadow: [
            if (showShadow)
              BoxShadow(
                color: AdminColors.grey.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 5,
                offset: const Offset(0, 3),
              ),
          ],
          color: backgroundColor,
        ),
        child: child,
      ),
    );
  }
}
