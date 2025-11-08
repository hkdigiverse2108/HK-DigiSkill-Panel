import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/routes/routes_middleware.dart';
import 'package:hkdigiskill_admin/screens/login/login_page.dart';

class AppRoute {
  static final List<GetPage> pages = [
    GetPage(name: AdminRoutes.login, page: () => LoginPage()),
    GetPage(
      name: AdminRoutes.dashboard,
      page: () => Scaffold(body: Center(child: Text('Dashboard'))),
      middlewares: [RoutesMiddleware()],
    ),
  ];
}
