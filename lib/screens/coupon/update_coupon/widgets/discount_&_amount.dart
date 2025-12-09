import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/coupon/update_coupon/controllers/edit_coupon_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class DiscountAndAmount extends StatelessWidget {
  const DiscountAndAmount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EditCouponController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.discountSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            Text(
              "Discount & Amount",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(AdminSizes.spaceBtwItems),
            LayoutBuilder(
              builder: (context, constraints) =>
                  AdminHelperFunctions.isWidthValid(500)
                  ? Column(
                      children: [
                        Obx(
                          () => TextFormField(
                            decoration: InputDecoration(
                              labelText:
                                  (controller.discountType.value !=
                                      "Percentage")
                                  ? "Discount (₹)"
                                  : "Discount (%)",
                              prefixIcon:
                                  (controller.discountType.value !=
                                      "Percentage")
                                  ? const Icon(Icons.currency_rupee)
                                  : const Icon(Icons.percent),
                            ),
                            validator: (value) =>
                                AdminValidators.validateEmptyText(
                                  "discount",
                                  value,
                                ),
                            controller: controller.discountController,
                          ),
                        ),

                        const Gap(AdminSizes.spaceBtwInputFields),

                        DropdownButtonFormField(
                          initialValue: controller.discountType.value,
                          decoration: InputDecoration(
                            labelText: "Discount Type",
                            prefixIcon: const Icon(Iconsax.activity),
                          ),
                          validator: (value) =>
                              AdminValidators.validateEmptyText(
                                "discount type",
                                value,
                              ),
                          items: controller.discountTypeList
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
                          child: Obx(
                            () => TextFormField(
                              decoration: InputDecoration(
                                labelText:
                                    (controller.discountType.value !=
                                        "Percentage")
                                    ? "Discount (₹)"
                                    : "Discount (%)",
                                prefixIcon:
                                    (controller.discountType.value !=
                                        "Percentage")
                                    ? const Icon(Icons.currency_rupee)
                                    : const Icon(Icons.percent),
                              ),
                              validator: (value) =>
                                  AdminValidators.validateEmptyText(
                                    "discount",
                                    value,
                                  ),
                              controller: controller.discountController,
                            ),
                          ),
                        ),

                        const Gap(AdminSizes.spaceBtwInputFields),

                        Expanded(
                          child: DropdownButtonFormField(
                            initialValue: controller.discountType.value,
                            decoration: InputDecoration(
                              labelText: "Discount Type",
                              prefixIcon: const Icon(Iconsax.activity),
                            ),
                            validator: (value) =>
                                AdminValidators.validateEmptyText(
                                  "discount type",
                                  value,
                                ),
                            items: controller.discountTypeList
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
            LayoutBuilder(
              builder: (context, constraints) =>
                  AdminHelperFunctions.isWidthValid(500)
                  ? Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Min Amount (₹)",
                            prefixIcon: Icon(Icons.currency_rupee),
                          ),
                          controller: controller.minAmountController,
                        ),

                        const Gap(AdminSizes.spaceBtwInputFields),

                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Max Discount Amount (₹)",
                            prefixIcon: Icon(Icons.currency_rupee),
                          ),
                          validator: (value) =>
                              AdminValidators.validateEmptyText(
                                "max discount amount",
                                value,
                              ),
                          controller: controller.maxDiscountAmountController,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Min Amount (₹)",
                              prefixIcon: Icon(Icons.currency_rupee),
                            ),
                            controller: controller.minAmountController,
                          ),
                        ),

                        const Gap(AdminSizes.spaceBtwInputFields),

                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Max Discount Amount (₹)",
                              prefixIcon: Icon(Icons.currency_rupee),
                            ),
                            validator: (value) =>
                                AdminValidators.validateEmptyText(
                                  "max discount amount",
                                  value,
                                ),
                            controller: controller.maxDiscountAmountController,
                          ),
                        ),
                      ],
                    ),
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Max Usage",
                prefixIcon: const Icon(Iconsax.user),
              ),
              controller: controller.minAmountController,
            ),
          ],
        ),
      ),
    );
  }
}
