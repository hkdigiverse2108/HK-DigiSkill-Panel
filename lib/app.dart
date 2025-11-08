import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/app_routes.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Admin Panel',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      initialRoute: AdminRoutes.login,
      getPages: AppRoute.pages,
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const Scaffold(body: Center(child: Text('404 Not Found'))),
      ),
    );
  }
}
