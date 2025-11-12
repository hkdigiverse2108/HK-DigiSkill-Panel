import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/user_model.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/popups/full_screen_loader.dart';

import '../../../data/repositories/network_manager.dart' show NetworkManager;

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final storageService = AdminStorageService();

  final email = TextEditingController(text: "Admin@gmail.com");
  final password = TextEditingController(text: "Admin@123");
  final loginFormKey = GlobalKey<FormState>();

  Future<void> login() async {
    try {
      AdminFullScreenLoader.openLoadingDialog(
        "E-mail Address Verified, Otp is being sent...",
        AdminImages.sendOtpAnimation,
      );
      await Future.delayed(const Duration(seconds: 2));

      final isConnected = await NetworkManager.instance.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        AdminFullScreenLoader.stopLoading();
        AdminLoaders.errorSnackBar(
          title: "No Internet Connection",
          message: "Please check your internet connection and try again.",
          // message: "Something went wrong. Please try again.",
        );
        return;
      }
      // for validation
      if (!loginFormKey.currentState!.validate()) {
        AdminFullScreenLoader.stopLoading();
        return;
      }

      AdminFullScreenLoader.stopLoading();

      screenRedirect();
    } catch (e) {
      AdminFullScreenLoader.stopLoading();
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    }
  }

  void screenRedirect() {
    // if (storageService.user != null) {
    Get.toNamed(
      AdminRoutes.otp,
      arguments: {"email": email.text, "forPasswordReset": false},
    );
    //   } else {
    //     Get.offAllNamed(AdminRoutes.login);
    //   }
  }
}
