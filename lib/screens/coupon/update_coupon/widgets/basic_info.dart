import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/coupon/update_coupon/controllers/edit_coupon_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:hkdigiskill_admin/utils/helpers/validators.dart';
import 'package:iconsax/iconsax.dart';

class CouponBasicInfo extends StatelessWidget {
  const CouponBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EditCouponController.instance;
    return AdminRoundedContainer(
      child: Form(
        key: controller.titleSectionForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information Title
            Text("Basic Info", style: Theme.of(context).textTheme.titleMedium),
            const Gap(AdminSizes.spaceBtwItems),

            // workshop title
            TextFormField(
              validator: (value) =>
                  AdminValidators.validateEmptyText("title", value),
              decoration: const InputDecoration(
                labelText: "Title",
                prefixIcon: Icon(Iconsax.activity),
              ),
              controller: controller.titleController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),

            // workshop subtitle
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Coupon Code",
                prefixIcon: Icon(Iconsax.keyboard),
              ),
              validator: (value) =>
                  AdminValidators.validateEmptyText("coupon code", value),
              controller: controller.couponCodeController,
            ),
            const Gap(AdminSizes.spaceBtwInputFields),
            LayoutBuilder(
              builder: (context, constraints) =>
                  AdminHelperFunctions.isWidthValid(500)
                  ? Column(
                      children: [
                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Start Date",
                            suffixIcon: InkWell(
                              child: const Icon(Iconsax.calendar_1),
                              onTap: () async {
                                controller.startDateController.text =
                                    await controller.pickDate(context) ??
                                    controller.startDateController.text;
                              },
                            ),
                          ),
                          controller: controller.startDateController,
                        ),

                        const Gap(AdminSizes.spaceBtwInputFields),

                        TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "End Date",
                            suffixIcon: InkWell(
                              child: const Icon(Iconsax.calendar_1),
                              onTap: () async {
                                controller.endDateController.text =
                                    await controller.pickDate(context) ??
                                    controller.endDateController.text;
                              },
                            ),
                          ),
                          controller: controller.endDateController,
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "Start Date",
                              suffixIcon: InkWell(
                                child: const Icon(Iconsax.calendar_1),
                                onTap: () async {
                                  controller.startDateController.text =
                                      await controller.pickDate(context) ??
                                      controller.startDateController.text;
                                },
                              ),
                            ),
                            controller: controller.startDateController,
                          ),
                        ),

                        const Gap(AdminSizes.spaceBtwInputFields),

                        Expanded(
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              labelText: "End Date",
                              suffixIcon: InkWell(
                                child: const Icon(Iconsax.calendar_1),
                                onTap: () async {
                                  controller.endDateController.text =
                                      await controller.pickDate(context) ??
                                      controller.endDateController.text;
                                },
                              ),
                            ),
                            controller: controller.endDateController,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
