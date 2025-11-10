import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:hkdigiskill_admin/screens/login/widgets/login_form.dart';
import 'package:hkdigiskill_admin/screens/login/widgets/login_header.dart';

class LoginPageDesktopTablet extends StatelessWidget {
  const LoginPageDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      child: Column(children: [AdminLoginHeader(), AdminLoginForm()]),
    );
  }
}
