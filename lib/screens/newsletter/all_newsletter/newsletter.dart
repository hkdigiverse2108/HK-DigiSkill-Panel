import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/newsletter/all_newsletter/responsive_screens/newsletter_desktop.dart';

class Newsletter extends StatelessWidget {
  const Newsletter({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(desktop: NewsletterDesktopScreen());
  }
}
