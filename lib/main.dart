import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/app.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Remove # sign from url
  setPathUrlStrategy();

  runApp(const App());
}
