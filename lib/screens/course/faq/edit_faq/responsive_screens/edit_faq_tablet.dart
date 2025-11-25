import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/faq_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/course/faq/edit_faq/widgets/edit_faq_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CourseEditFaqTabletScreen extends StatelessWidget {
  const CourseEditFaqTabletScreen({super.key, required this.faq});

  final FaqModel faq;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdminBreadcrumbWithHeading(
              returnToPreviousScreen: true,
              breadcrumbsItems: [AdminRoutes.cFaq, 'Edit FAQ'],
              heading: 'Edit FAQ',
            ),
            const Gap(AdminSizes.spaceBtwSections),
            CourseEditFaqForm(faq: faq),
          ],
        ),
      ),
    );
  }
}
