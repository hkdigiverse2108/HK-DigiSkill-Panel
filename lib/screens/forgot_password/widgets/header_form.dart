import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';
import 'package:hkdigiskill_admin/util/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Iconsax.arrow_left),
        ),
        const Gap(AdminSizes.spaceBtwItems),
        Text(
          AdminTexts.forgotPasswordTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(AdminSizes.spaceBtwItems),
        Text(
          AdminTexts.forgotPasswordSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Gap(AdminSizes.spaceBtwSections),

        /// Form
        Form(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: AdminTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
        ),
        const Gap(AdminSizes.spaceBtwSections),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(
                AdminRoutes.otp,
                parameters: {"email": "Admin@gmail.com"},
              );
            },
            child: Text(AdminTexts.submit),
          ),
        ),
        const Gap(AdminSizes.spaceBtwSections),
      ],
    );
  }
}
