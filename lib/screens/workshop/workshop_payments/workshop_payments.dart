import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/workshop/workshop_payments/responsive_screens/workshop_payment_desktop.dart';

class WorkshopPayments extends StatelessWidget {
  const WorkshopPayments({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(desktop: const WorkshopPaymentDesktopScreen());
  }
}
