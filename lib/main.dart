import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hkdigiskill_admin/app.dart';
import 'package:hkdigiskill_admin/data/repositories/auth_repositories.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Remove # sign from url
  setPathUrlStrategy();

  await GetStorage.init().then((value) => Get.put(AuthRepositories()));

  runApp(const App());
}
