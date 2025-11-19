import 'package:get/get.dart';
import 'package:hkdigiskill_admin/bindings/category_binding.dart';
import 'package:hkdigiskill_admin/bindings/login_binding.dart';
import 'package:hkdigiskill_admin/bindings/otp_binding.dart';
import 'package:hkdigiskill_admin/bindings/workshop_binding.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/routes/routes_middleware.dart';
import 'package:hkdigiskill_admin/screens/category/all_category/category.dart';
import 'package:hkdigiskill_admin/screens/category/create_category/create_category.dart';
import 'package:hkdigiskill_admin/screens/category/edit_category/edit_category.dart';
import 'package:hkdigiskill_admin/screens/dashboard/dashboard.dart';
import 'package:hkdigiskill_admin/screens/forgot_password/forgot_password.dart';
import 'package:hkdigiskill_admin/screens/login/login_page.dart';
import 'package:hkdigiskill_admin/screens/otp/otp.dart';
import 'package:hkdigiskill_admin/screens/reset_password/reset_password.dart';
import 'package:hkdigiskill_admin/screens/transactions/transactions.dart';
import 'package:hkdigiskill_admin/screens/workshop/all_workshop/all_workshop.dart';

class AppRoute {
  static final List<GetPage> pages = [
    GetPage(
      name: AdminRoutes.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AdminRoutes.otp,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AdminRoutes.forgotPassword,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(name: AdminRoutes.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(
      name: AdminRoutes.dashboard,
      page: () => DashboardScreen(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.transactions,
      page: () => TransactionsScreen(),
      middlewares: [RoutesMiddleware()],
    ),

    // Category
    GetPage(
      name: AdminRoutes.category,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.createCategory,
      page: () => CreateCategoryScreen(),
      binding: CategoryBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
      name: AdminRoutes.editCategory,
      page: () => EditCategoryScreen(),
      binding: CategoryBinding(),
      middlewares: [RoutesMiddleware()],
    ),

    // Workshop
    GetPage(
      name: AdminRoutes.wWorkshops,
      page: () => AllWorkshopScreen(),
      binding: WorkshopBinding(),
      middlewares: [RoutesMiddleware()],
    ),
    // GetPage(
    //   name: AdminRoutes.createWorkshop,
    //   page: () => CreateWorkshopScreen(),
    //   binding: WorkshopBinding(),
    //   middlewares: [RoutesMiddleware()],
    // ),
    // GetPage(
    //   name: AdminRoutes.editWorkshop,
    //   page: () => EditWorkshopScreen(),
    //   binding: WorkshopBinding(),
    //   middlewares: [RoutesMiddleware()],
    // ),
  ];
}
