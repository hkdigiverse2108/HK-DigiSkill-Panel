import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';

import '../common/widgets/layouts/sidebars/controllers/sidebar_controller.dart';

class AdminRouteObserver extends GetObserver {
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (previousRoute != null) {
      // Check the route name and update the active item in the sidebar accordingly
      for (var routeName in AdminRoutes.sidebarMenuItems) {
        if (previousRoute.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (route != null) {
      // Check the route name and update the active item in the sidebar accordingly
      for (var routeName in AdminRoutes.sidebarMenuItems) {
        if (route.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }
}
