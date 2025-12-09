import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';

class SidebarController extends GetxController {
  final activeItem = AdminRoutes.dashboard.obs;
  final hoverItem = ''.obs;

  /// NEW: store expanded states for each menu
  final expandedItems = <String, bool>{}.obs;

  void changeActiveItem(String route) => activeItem.value = route;

  void changeHoverItem(String route) {
    if (!isActive(route)) hoverItem.value = route;
  }

  void toggleExpand(String route) {
    expandedItems[route] = !(expandedItems[route] ?? false);
  }

  bool isActive(String route) => activeItem.value == route;

  bool isExpanded(String route) => expandedItems[route] ?? false;

  bool isHovering(String route) => hoverItem.value == route;

  void menuOnTap(String route, {bool isSubItem = false, String? parentRoute}) {
    if (!isActive(route)) {
      changeActiveItem(route);

      // If this is a sub-item and has a parent route, expand the parent
      if (isSubItem && parentRoute != null) {
        expandedItems[parentRoute] = true;
      }

      if (AdminDeviceUtility.isMobileScreen(Get.context!)) Get.back();

      Get.toNamed(route);
    }
  }
}
