import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/screens/category/controllers/category_controller.dart';
import 'package:hkdigiskill_admin/screens/category/table/data_table.dart';
import 'package:hkdigiskill_admin/screens/category/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class CategoryDesktopScreen extends StatelessWidget {
  const CategoryDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AdminBreadcrumbWithHeading(
                  breadcrumbsItems: ["Category Screen"],
                  heading: "Category",
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            Center(child: CategoryTable()),
          ],
        ),
      ),
    );
  }
}
