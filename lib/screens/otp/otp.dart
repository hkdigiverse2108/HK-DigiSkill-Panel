import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/site_layouts.dart';
import 'package:hkdigiskill_admin/screens/otp/responsive_screens/otp_desktop_tablet.dart';
import 'package:hkdigiskill_admin/screens/otp/responsive_screens/otp_mobile.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Get.parameters["email"] ?? "";
    return AdminSiteLayouts(
      useLayout: false,
      mobile: OtpScreenMobile(),
      desktop: OtpScreenDesktopTablet(),
    );
  }
}
