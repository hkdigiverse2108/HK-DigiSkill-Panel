import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';

class RoutesMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final isAuthenticated = true;

    return isAuthenticated
        ? null
        : const RouteSettings(name: AdminRoutes.login);
  }
}
