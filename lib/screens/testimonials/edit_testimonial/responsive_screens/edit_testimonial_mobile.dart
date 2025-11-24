import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/data/models/testimonial_model.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/testimonials/edit_testimonial/widgets/edit_testimonial_form.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class EditTestimonialMobileScreen extends StatelessWidget {
  const EditTestimonialMobileScreen({super.key, required this.item});

  final TestimonialModel item;

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
              breadcrumbsItems: [AdminRoutes.testimonials, 'Testimonials'],
              heading: 'Edit Testimonial',
            ),
            const Gap(AdminSizes.spaceBtwSections),
            EditTestimonialForm(item: item),
          ],
        ),
      ),
    );
  }
}
