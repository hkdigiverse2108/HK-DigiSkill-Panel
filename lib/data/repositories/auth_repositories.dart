import 'package:get/get.dart';
import 'package:hkdigiskill_admin/data/models/user_model.dart';
import 'package:hkdigiskill_admin/data/services/storage_service.dart';

class AuthRepositories extends GetxController {
  static AuthRepositories get instance => Get.find();

  final storageService = AdminStorageService();

  UserModel? get user => storageService.user == null
      ? null
      : UserModel.fromJson(storageService.user!);

  bool get isAuthenticated => user != null;

  @override
  void onReady() {}
}
