import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';

import 'responsive_screens/forget_password_desktop_table.dart';
import 'responsive_screens/forgot_password_mobile.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminSiteLayouts(
      useLayout: false,
      mobile: ForgotPasswordScreenMobile(),
      desktop: ForgetPasswordScreenDesktopTable(),
    );
  }
}
