import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/routes/routes_middleware.dart';
import 'package:hkdigiskill_admin/screens/forgot_password/forgot_password.dart';
import 'package:hkdigiskill_admin/screens/login/login_page.dart';
import 'package:hkdigiskill_admin/screens/otp/otp.dart';
import 'package:hkdigiskill_admin/screens/reset_password/reset_password.dart';

class AppRoute {
  static final List<GetPage> pages = [
    GetPage(name: AdminRoutes.login, page: () => LoginPage()),
    GetPage(name: AdminRoutes.otp, page: () => OtpScreen()),
    GetPage(
      name: AdminRoutes.forgotPassword,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(name: AdminRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(
      name: AdminRoutes.dashboard,
      page: () => Scaffold(body: Center(child: Text('Dashboard'))),
      middlewares: [RoutesMiddleware()],
    ),
  ];
}
