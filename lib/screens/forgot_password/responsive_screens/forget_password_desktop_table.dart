import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:hkdigiskill_admin/screens/forgot_password/widgets/header_form.dart';

class ForgetPasswordScreenDesktopTable extends StatelessWidget {
  const ForgetPasswordScreenDesktopTable({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(child: HeaderAndForm());
  }
}
