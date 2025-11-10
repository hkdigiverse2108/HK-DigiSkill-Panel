import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/otp/widgets/otp_header_form.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';
import 'package:hkdigiskill_admin/util/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class OtpScreenDesktopTablet extends StatelessWidget {
  const OtpScreenDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(child: OtpHeaderAndForm());
  }
}
