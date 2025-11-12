import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/headers/header.dart';
import 'package:hkdigiskill_admin/screens/login/widgets/login_form.dart';
import 'package:hkdigiskill_admin/screens/login/widgets/login_header.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class LoginPageMobile extends StatelessWidget {
  const LoginPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AdminSizes.defaultSpace),
        child: Column(children: [AdminLoginHeader(), AdminLoginForm()]),
      ),
    );
  }
}
