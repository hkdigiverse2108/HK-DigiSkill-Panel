import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class AdminAnimationLoaderWidget extends StatelessWidget {
  const AdminAnimationLoaderWidget({
    super.key,
    required this.text,
    this.style,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onAction,
    this.height,
    this.width,
  });

  final String text;
  final TextStyle? style;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onAction;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(
            animation,
            height: height ?? MediaQuery.of(context).size.height * 0.5,
            width: width,
          ),
          const Gap(AdminSizes.defaultSpace),
          Text(
            text,
            style: style ?? Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(AdminSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onAction,
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AdminColors.dark,
                    ),
                    child: Text(
                      actionText ?? "Retry",
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: AdminColors.light),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
