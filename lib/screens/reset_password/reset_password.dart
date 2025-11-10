import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';

import 'responsive_screens/reset_password_desktop_table.dart';
import 'responsive_screens/reset_password_mobile.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      useLayout: false,
      mobile: ResetPasswordScreenMobile(),
      desktop: ResetPasswordScreenDesktopTable(),
    );
  }
}
