import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';
import 'package:hkdigiskill_admin/util/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class AdminLoginForm extends StatelessWidget {
  const AdminLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AdminSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: InputDecoration(
                labelText: AdminTexts.email,
                prefixIcon: const Icon(Iconsax.direct_right, fill: 0),
              ),
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              decoration: InputDecoration(
                labelText: AdminTexts.password,
                prefixIcon: const Icon(Iconsax.password_check, fill: 0),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.eye_slash, fill: 0),
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
                    Checkbox(value: true, onChanged: (value) {}),
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
                onPressed: () {},
                child: Text(AdminTexts.signIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
