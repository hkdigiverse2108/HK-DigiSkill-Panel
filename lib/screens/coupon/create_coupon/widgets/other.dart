import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/coupon/create_coupon/controllers/create_coupon_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class Other extends StatelessWidget {
  const Other({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CreateCouponController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.otherSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            LayoutBuilder(
              builder: (context, constraints) =>
                  AdminHelperFunctions.isWidthValid(500)
                  ? Column(
                      children: [
                        DropdownButtonFormField(
                          initialValue: controller.appliesTo.value,
                          decoration: const InputDecoration(
                            labelText: "Applies To",
                            prefixIcon: Icon(Iconsax.activity),
                          ),
                          validator: (value) =>
                              AdminValidators.validateEmptyText(
                                "Applies To",
                                value,
                              ),
                          items: controller.appliesToList
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) {
                            controller.discountType.value = value!;
                          },
                        ),

                        const Gap(AdminSizes.spaceBtwInputFields),

                        DropdownButtonFormField(
                          initialValue: controller.status.value,
                          decoration: const InputDecoration(
                            labelText: "Status",
                            prefixIcon: Icon(Iconsax.activity),
                          ),
                          items: controller.statusList
                              .map(
                                (e) =>
                                    DropdownMenuItem(value: e, child: Text(e)),
                              )
                              .toList(),
                          onChanged: (value) {
                            controller.discountType.value = value!;
                          },
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            initialValue: controller.appliesTo.value,
                            decoration: const InputDecoration(
                              labelText: "Applies To",
                              prefixIcon: Icon(Iconsax.activity),
                            ),
                            validator: (value) =>
                                AdminValidators.validateEmptyText(
                                  "Applies To",
                                  value,
                                ),
                            items: controller.appliesToList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              controller.discountType.value = value!;
                            },
                          ),
                        ),

                        const Gap(AdminSizes.spaceBtwInputFields),

                        Expanded(
                          child: DropdownButtonFormField(
                            initialValue: controller.status.value,
                            decoration: const InputDecoration(
                              labelText: "Status",
                              prefixIcon: Icon(Iconsax.activity),
                            ),
                            items: controller.statusList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              controller.discountType.value = value!;
                            },
                          ),
                        ),
                      ],
                    ),
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () {
                        controller.createCoupon();
                      },
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : const Text("Create Coupon"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
