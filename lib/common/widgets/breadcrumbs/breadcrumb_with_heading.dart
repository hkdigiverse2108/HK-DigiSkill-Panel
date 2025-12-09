import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/headings/page_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AdminBreadcrumbWithHeading extends StatelessWidget {
  const AdminBreadcrumbWithHeading({
    super.key,
    required this.heading,
    required this.breadcrumbsItems,
    this.returnToPreviousScreen = false,
  });

  // Heading for the page
  final String heading;

  // List of breadcrumbs
  final List<String> breadcrumbsItems;

  // Flag indicating whether to include a button to return to the previous screen
  final bool returnToPreviousScreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Dashboard link
              InkWell(
                // Last item should not be clickable
                onTap: () => Get.offAllNamed(AdminRoutes.dashboard),

                child: Padding(
                  padding: const EdgeInsets.all(AdminSizes.xs),
                  child: Text(
                    "Dashboard",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.apply(fontWeightDelta: -1),
                  ),
                ),
              ),

              for (int i = 0; i < breadcrumbsItems.length; i++) ...[
                const Text('/'),
                InkWell(
                  onTap: i == breadcrumbsItems.length - 1
                      ? null
                      : () => Get.toNamed(breadcrumbsItems[i]),
                  child: Padding(
                    padding: const EdgeInsets.all(AdminSizes.xs),
                    // Format breadcrumbs item: capitalize and remove leading '/'
                    child: Text(
                      i == breadcrumbsItems.length - 1
                          ? breadcrumbsItems[i].capitalize.toString()
                          : capitalize(breadcrumbsItems[i].substring(1)),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.apply(fontWeightDelta: -1),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const Gap(AdminSizes.sm),

        // Heading
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (returnToPreviousScreen)
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Iconsax.arrow_left),
                ),
              if (returnToPreviousScreen) const Gap(AdminSizes.spaceBtwItems),
              AdminPageHeadings(heading: heading),
            ],
          ),
        ),
      ],
    );
  }

  String capitalize(String input) {
    return input.isEmpty ? "" : input[0].toUpperCase() + input.substring(1);
  }
}
