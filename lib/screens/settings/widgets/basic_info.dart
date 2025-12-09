import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/settings/controllers/settings_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:iconsax/iconsax.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SettingsController.instance;
    return AdminRoundedContainer(
      padding: EdgeInsets.all(AdminSizes.defaultSpace),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Basic Information",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Gap(AdminSizes.spaceBtwItems),
          LayoutBuilder(
            builder: (context, constraints) =>
                AdminHelperFunctions.isWidthValid(500)
                ? Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "email",
                          prefixIcon: Icon(Iconsax.direct_right),
                        ),
                        controller: controller.emailController,
                      ),
                      const Gap(AdminSizes.spaceBtwItems),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                          prefixIcon: Icon(Iconsax.mobile),
                        ),
                        controller: controller.phoneNumberController,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "email",
                            prefixIcon: Icon(Iconsax.direct_right),
                          ),
                          controller: controller.emailController,
                        ),
                      ),
                      const Gap(AdminSizes.spaceBtwItems),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            prefixIcon: Icon(Iconsax.mobile),
                          ),
                          controller: controller.phoneNumberController,
                        ),
                      ),
                    ],
                  ),
          ),
          const Gap(AdminSizes.spaceBtwItems),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Address",
              prefixIcon: Icon(Iconsax.location),
            ),
            controller: controller.addressController,
          ),
          const Gap(AdminSizes.spaceBtwItems),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "link",
              prefixIcon: Icon(Iconsax.link),
            ),
            controller: controller.linkController,
          ),
          const Gap(AdminSizes.fontSizeLg),
        ],
      ),
    );
  }
}
