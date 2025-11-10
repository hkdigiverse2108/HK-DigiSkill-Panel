import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/templates/login_template.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/forgot_password/widgets/header_form.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';
import 'package:hkdigiskill_admin/util/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class ResetPasswordScreenDesktopTable extends StatelessWidget {
  const ResetPasswordScreenDesktopTable({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Iconsax.arrow_left),
          ),
          const Gap(AdminSizes.spaceBtwItems),
          Text(
            AdminTexts.resetPasswordTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(AdminSizes.spaceBtwItems),
          Text(
            AdminTexts.resetPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          // const Gap(AdminSizes.spaceBtwSections),

          /// Form
          Form(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AdminSizes.spaceBtwSections,
              ),
              child: Column(
                children: [
                  /// New password
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: AdminTexts.newPassword,
                      prefixIcon: const Icon(Iconsax.password_check, fill: 0),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.eye_slash, fill: 0),
                      ),
                    ),
                  ),

                  const Gap(AdminSizes.spaceBtwInputFields),

                  /// Conform Password
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: AdminTexts.confirmPassword,
                      prefixIcon: const Icon(Iconsax.password_check, fill: 0),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Iconsax.eye_slash, fill: 0),
                      ),
                    ),
                  ),
                  const Gap(AdminSizes.spaceBtwSections),

                  /// Sign In Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(AdminTexts.submit),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
