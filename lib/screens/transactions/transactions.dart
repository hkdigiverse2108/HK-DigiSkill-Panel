import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';

import 'responsive_screens/transactions_desktop.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(desktop: TransactionsDesktopScreen());
  }
}
