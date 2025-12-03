import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/course/course_payments/responsive_screens/course_payment_desktop.dart'
    show CoursePaymentDesktopScreen;

class CoursePayments extends StatelessWidget {
  const CoursePayments({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(desktop: const CoursePaymentDesktopScreen());
  }
}
