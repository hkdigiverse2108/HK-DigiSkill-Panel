import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/bindings/General_bindings.dart';
import 'package:hkdigiskill_admin/routes/app_routes.dart';
import 'package:hkdigiskill_admin/routes/route_observer.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Admin Panel',
      theme: AdminTheme.adminLightTheme,
      // darkTheme: AdminTheme.adminDarkTheme,
      // themeMode: ThemeMode.system,
      initialRoute: AdminRoutes.dashboard,
      getPages: AppRoute.pages,
      initialBinding: GeneralBindings(),
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const Scaffold(body: Center(child: Text('404 Not Found'))),
      ),
      navigatorObservers: [AdminRouteObserver()],
    );
  }
}
