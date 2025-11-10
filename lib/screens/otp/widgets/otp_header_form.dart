import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';
import 'package:hkdigiskill_admin/util/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

class OtpHeaderAndForm extends StatelessWidget {
  const OtpHeaderAndForm({super.key});

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
          AdminTexts.otpTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(AdminSizes.spaceBtwItems),
        Text(
          AdminTexts.otpSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const Gap(AdminSizes.spaceBtwSections),

        /// Form
        Form(
          child: TextFormField(
            decoration: InputDecoration(
              labelText: AdminTexts.otp,
              prefixIcon: Icon(Iconsax.activity),
            ),
          ),
        ),
        const Gap(AdminSizes.spaceBtwSections / 2),
        Row(
          children: [
            Text("Did not receive the OTP?"),
            TextButton(onPressed: () {}, child: Text("Resend OTP")),
          ],
        ),

        const Gap(AdminSizes.spaceBtwSections),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(
                AdminRoutes.resetPassword,
                // arguments: "Admin@gmail.com",
              );
            },
            child: Text(AdminTexts.aContinue),
          ),
        ),
        const Gap(AdminSizes.spaceBtwSections),
      ],
    );
  }
}
