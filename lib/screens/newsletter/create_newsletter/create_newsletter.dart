import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/newsletter/create_newsletter/responsive_screens/create_newsletter_desktop.dart';

class CreateNewsletterScreen extends StatelessWidget {
  const CreateNewsletterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminSiteLayouts(
      // mobile: CreateNewsletterMobile(),
      // tablet: CreateNewsletterTablet(),
      desktop: CreateNewsletterDesktop(),
    );
  }
}
