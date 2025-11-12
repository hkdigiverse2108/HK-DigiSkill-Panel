import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/login/controllers/login_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/constants/text_strings.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class AdminLoginForm extends StatelessWidget {
  const AdminLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AdminSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: AdminValidators.emailValidator,
              decoration: InputDecoration(
                labelText: AdminTexts.email,
                prefixIcon: const Icon(Iconsax.direct_right, fill: 0),
              ),
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    AdminValidators.validateEmptyText("Password", value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: AdminTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check, fill: 0),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                      fill: 0,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(AdminSizes.spaceBtwInputFields / 2),

            /// Remember me & Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value = value!;
                        },
                      ),
                    ),
                    Text(
                      AdminTexts.rememberMe,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),

                /// Forgot password
                TextButton(
                  onPressed: () {
                    Get.toNamed(AdminRoutes.forgotPassword);
                  },
                  child: Text(AdminTexts.forgotPassword),
                ),
              ],
            ),
            const Gap(AdminSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.login,
                child: Text(AdminTexts.signIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
