import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/common/widgets/headings/section_heading.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AdminDashboardCard extends StatelessWidget {
  const AdminDashboardCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Iconsax.arrow_up_3,
    this.color = AdminColors.success,
    required this.stats,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final int stats;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AdminRoundedContainer(
      onTap: onTap,
      padding: EdgeInsets.all(AdminSizes.lg),
      child: Column(
        children: [
          // heading
          AdminSectionHeading(
            title: title,
            textColor: AdminColors.textSecondary,
          ),
          const Gap(AdminSizes.spaceBtwSections),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subtitle, style: Theme.of(context).textTheme.titleLarge),

              /// Right side stats
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(icon, color: color, size: AdminSizes.iconSm),
                        Text(
                          "$stats%",
                          style: Theme.of(context).textTheme.titleMedium!.apply(
                            color: color,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 140,
                    child: Text(
                      "Compared to Aug 2025",
                      style: Theme.of(context).textTheme.labelSmall,
                      textAlign: TextAlign.end,
                      // maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
