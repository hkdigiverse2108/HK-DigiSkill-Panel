import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'responsive_screens/login_desktop_tablet.dart';
import 'responsive_screens/login_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminSiteLayouts(
        useLayout: false,
        mobile: LoginPageMobile(),
        desktop: LoginPageDesktopTablet(),
      ),
    );
  }
}
