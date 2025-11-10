import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/screens/forgot_password/widgets/header_form.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';

class ForgotPasswordScreenMobile extends StatelessWidget {
  const ForgotPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: HeaderAndForm(),
      ),
    );
  }
}
