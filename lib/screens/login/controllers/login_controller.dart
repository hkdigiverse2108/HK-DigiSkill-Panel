import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/loaders/loaders.dart';
import 'package:hkdigiskill_admin/data/models/login_model.dart';
import 'package:hkdigiskill_admin/data/services/api_service.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/utils/constants/api_constants.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';
import 'package:hkdigiskill_admin/utils/popups/full_screen_loader.dart';

import '../../../data/repositories/network_manager.dart' show NetworkManager;

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final storageService = AdminStorageService();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  final apiService = ApiService(baseUrl: ApiConstants.baseUrl);

  Future<void> login() async {
    try {
      AdminFullScreenLoader.openLoadingDialog(
        "E-mail Address Verified, Otp is being sent...",
        AdminImages.sendOtpAnimation,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      log(isConnected.toString());
      if (!isConnected) {
        AdminLoaders.errorSnackBar(
          title: "No Internet Connection",
          message: "Please check your internet connection and try again.",
          // message: "Something went wrong. Please try again.",
        );
        return;
      }
      // for validation
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      final response = await apiService.post(
        path: ApiConstants.login,
        body: {"email": email.text, "password": password.text},
        decoder: (json) => LoginModel.fromJson(json),
      );
      final token = response.data.token;
      final data = response.data;

      final user = {
        'id': data.id,
        'email': data.email,
        'name': data.fullName,
        'token': data.token,
      };

      storageService.token = token;
      storageService.user = user;
      storageService.role = data.role;
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
    Get.offAllNamed(AdminRoutes.dashboard);
    // if (storageService.user != null) {
    // Get.toNamed(
    //   AdminRoutes.otp,
    //   arguments: {"email": email.text, "forPasswordReset": false},
    // );
    //   } else {
    //     Get.offAllNamed(AdminRoutes.login);
    //   }
  }
}
