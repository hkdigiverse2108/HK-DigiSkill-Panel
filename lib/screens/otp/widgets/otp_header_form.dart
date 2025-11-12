import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/screens/otp/controllers/otp_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/constants/text_strings.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class OtpHeaderAndForm extends StatelessWidget {
  const OtpHeaderAndForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OtpController.instance;
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
          key: controller.otpFormKey,
          child: TextFormField(
            controller: controller.otp,
            validator: AdminValidators.validateOtp,
            decoration: InputDecoration(
              labelText: AdminTexts.otp,
              prefixIcon: Icon(Iconsax.activity),
            ),
            keyboardType: TextInputType.number,
            maxLength: 6,
          ),
        ),
        const Gap(AdminSizes.spaceBtwSections / 2),
        Obx(
          () => Row(
            children: [
              Text("Did not receive the OTP?"),
              Gap(10),
              if (controller.timer.value == 0)
                TextButton(
                  onPressed: () {
                    controller.onResendOtp();
                  },
                  child: Text("Resend OTP"),
                )
              else
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        value: controller.timer.value / 30,
                        backgroundColor: AdminColors.grey,
                        valueColor: AlwaysStoppedAnimation(AdminColors.primary),
                        strokeWidth: 4,
                      ),
                    ),
                    Text(
                      '${controller.timer.value}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
            ],
          ),
        ),

        const Gap(AdminSizes.spaceBtwSections),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              controller.verifyOtp();
            },
            child: Text(AdminTexts.aContinue),
          ),
        ),
        const Gap(AdminSizes.spaceBtwSections),
      ],
    );
  }
}
