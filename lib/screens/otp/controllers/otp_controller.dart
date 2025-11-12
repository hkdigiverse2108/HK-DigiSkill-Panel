import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/user_model.dart';
import 'package:hkdigiskill_admin/data/repositories/network_manager.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/popups/full_screen_loader.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  final storageService = AdminStorageService();
  var email = '';
  var forPasswordReset = false;

  var timer = 0.obs;

  var otp = TextEditingController();

  final otpFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'] ?? "";
    forPasswordReset = Get.arguments['forPasswordReset'] ?? false;

    startTimer(seconds: 30);
  }

  void startTimer({int seconds = 60}) {
    timer.value = seconds;
    Timer.periodic(Duration(seconds: 1), (t) {
      if (timer.value == 0) {
        t.cancel();
        update();
        // Optionally notify UI for "Resend OTP enabled"
      } else {
        timer.value--;
        update();
      }
    });
  }

  Future<void> onResendOtp() async {
    try {
      AdminFullScreenLoader.openLoadingDialog(
        "Resending OTP...",
        AdminImages.sendOtpAnimation,
      );
      await Future.delayed(const Duration(seconds: 2));
      AdminFullScreenLoader.stopLoading();
      startTimer(seconds: 30);
    } catch (e) {
      AdminFullScreenLoader.stopLoading();
      AdminLoaders.errorSnackBar(
        title: "Error",
        message: e.toString(),
        // message: "Something went wrong. Please try again.",
      );
    }
  }

  Future<void> verifyOtp() async {
    try {
      AdminFullScreenLoader.openLoadingDialog(
        "Verifying OTP...",
        AdminImages.loginAnimation,
      );
      await Future.delayed(const Duration(seconds: 2));

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AdminFullScreenLoader.stopLoading();
        AdminLoaders.errorSnackBar(
          title: "No Internet Connection",
          message: "Please check your internet connection and try again.",
        );
        return;
      }

      if (!otpFormKey.currentState!.validate()) {
        AdminFullScreenLoader.stopLoading();
        return;
      }

      // Simulate successful OTP verification
      // In a real app, you would verify the OTP with your backend here
      await Future.delayed(const Duration(seconds: 1));

      // Store user data and token after successful verification
      final user = UserModel(
        id: '1', // Replace with actual user ID from your API
        email: email,
        name: 'Admin User', // Replace with actual user name
        // Add other required user fields
      );

      // Store user data and token
      storageService.user = user.toJson();
      storageService.token =
          'your_auth_token_here'; // Replace with actual token from API

      AdminFullScreenLoader.stopLoading();

      // Redirect based on the flow
      screenRedirect();
    } catch (e) {
      AdminFullScreenLoader.stopLoading();
      AdminLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  void screenRedirect() {
    if (storageService.isLoggedIn) {
      if (forPasswordReset) {
        Get.offNamed(AdminRoutes.resetPassword);
      } else {
        Get.offAllNamed(AdminRoutes.dashboard);
      }
    } else {
      AdminLoaders.errorSnackBar(
        title: "Authentication Failed",
        message: "Could not verify your account. Please try again.",
      );
      Get.offAllNamed(AdminRoutes.login);
    }
  }
}
