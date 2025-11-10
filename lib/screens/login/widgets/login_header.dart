import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/util/constants/image_strings.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';
import 'package:hkdigiskill_admin/util/constants/text_strings.dart';

class AdminLoginHeader extends StatelessWidget {
  const AdminLoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            height: 100,
            width: 200,
            image: AssetImage(AdminImages.logo),
          ),
          const Gap(AdminSizes.spaceBtwSections),
          Text(
            AdminTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Gap(AdminSizes.sm),
          Text(
            AdminTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
