import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class TransactionsDesktopScreen extends StatelessWidget {
  const TransactionsDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            // Row(children: [AdminBreadcrumbWithHeading()]),
          ],
        ),
      ),
    );
  }
}
