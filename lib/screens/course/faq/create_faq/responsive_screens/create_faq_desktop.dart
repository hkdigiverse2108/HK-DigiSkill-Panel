import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/faq/create_faq/widgets/create_faq_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CourseCreateFaqDesktopScreen extends StatelessWidget {
  const CourseCreateFaqDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                AdminBreadcrumbWithHeading(
                  returnToPreviousScreen: true,
                  breadcrumbsItems: [AdminRoutes.cFaq, 'Course FAQ'],
                  heading: 'Create FAQ',
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwSections),
            const CourseCreateFaqForm(),
          ],
        ),
      ),
    );
  }
}
