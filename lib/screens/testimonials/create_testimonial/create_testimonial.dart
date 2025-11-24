import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/testimonials/create_testimonial/responsive_screens/create_testimonial_desktop.dart';
import 'package:hkdigiskill_admin/screens/testimonials/create_testimonial/responsive_screens/create_testimonial_mobile.dart';
import 'package:hkdigiskill_admin/screens/testimonials/create_testimonial/responsive_screens/create_testimonial_tablet.dart';

class CreateTestimonialScreen extends StatelessWidget {
  const CreateTestimonialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      mobile: CreateTestimonialMobileScreen(),
      tablet: CreateTestimonialTabletScreen(),
      desktop: CreateTestimonialDesktopScreen(),
    );
  }
}
