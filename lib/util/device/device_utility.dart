import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';

class AdminDeviceUtility {
  static double getAppBarHeight() {
    return AdminSizes.appBarHeight;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= AdminSizes.desktopScreenSize;
  }

  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= AdminSizes.tabletScreenSize &&
        MediaQuery.of(context).size.width < AdminSizes.desktopScreenSize;
  }

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < AdminSizes.tabletScreenSize;
  }
}
