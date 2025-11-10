import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/screens/otp/widgets/otp_header_form.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';

class OtpScreenMobile extends StatelessWidget {
  const OtpScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: OtpHeaderAndForm(),
      ),
    );
  }
}
