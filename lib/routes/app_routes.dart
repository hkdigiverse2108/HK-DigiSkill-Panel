import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/bindings/login_binding.dart';
import 'package:hkdigiskill_admin/bindings/otp_binding.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/routes/routes_middleware.dart';
import 'package:hkdigiskill_admin/screens/dashboard/dashboard.dart';
import 'package:hkdigiskill_admin/screens/forgot_password/forgot_password.dart';
import 'package:hkdigiskill_admin/screens/login/login_page.dart';
import 'package:hkdigiskill_admin/screens/otp/otp.dart';
import 'package:hkdigiskill_admin/screens/reset_password/reset_password.dart';
import 'package:hkdigiskill_admin/screens/transactions/transactions.dart';

class AppRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: AdminRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AdminRoutes.otp,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AdminRoutes.forgotPassword,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(name: AdminRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(
      name: AdminRoutes.dashboard,
      page: () => DashboardScreen(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(name: AdminRoutes.transactions, page: () => TransactionsScreen()),
  ];
}
