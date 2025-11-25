import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/containers/rounded_container.dart';
import 'package:hkdigiskill_admin/screens/coupon/create_coupon/controllers/create_coupon_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';

class CreateCouponForm extends GetView<CreateCouponController> {
  const CreateCouponForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminRoundedContainer(
      // width: 700,
      padding: EdgeInsets.all(AdminSizes.defaultSpace),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Coupon',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: AdminSizes.spaceBtwSections),
            Row(children: []),

            SizedBox(height: AdminSizes.spaceBtwInputFields * 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
