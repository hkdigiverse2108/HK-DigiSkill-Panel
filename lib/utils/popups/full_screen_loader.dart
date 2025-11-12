import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';

class AdminFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: AdminHelperFunctions.isDarkMode(Get.context!)
              ? AdminColors.dark
              : AdminColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const Gap(250),
              AdminAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  // static void popUpCircular() {
  //   Get.defaultDialog(
  //     title: '',
  //     onWillPop: () async => false,
  //     content: const AdminCircularLoader(),
  //     backgroundColor: Colors.transparent,
  //   );
  // }

  /// stop the currently open loading dialog
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
