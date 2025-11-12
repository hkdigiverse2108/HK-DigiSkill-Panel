import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      desktop: Center(child: Text('Transactions Page')),
      // mobile: , tablet: ,
    );
  }
}
