import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/newsletter/create_newsletter/widgets/create_newsletter_form.dart';

class CreateNewsletterDesktop extends StatelessWidget {
  const CreateNewsletterDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AdminBreadcrumbWithHeading(
              heading: "Add Newsletter Subscriber",
              breadcrumbsItems: [AdminRoutes.newsLetter, "Add Newsletter"],
              returnToPreviousScreen: true,
            ),
            Gap(24),
            CreateNewsletterForm(),
          ],
        ),
      ),
    );
  }
}
