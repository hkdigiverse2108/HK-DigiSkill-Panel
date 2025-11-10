import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/styles/spacing_styles.dart';
import 'package:hkdigiskill_admin/util/constants/colors.dart';
import 'package:hkdigiskill_admin/util/constants/sizes.dart';
import 'package:hkdigiskill_admin/util/helpers/helpers.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: AdminSpacingStyles.paddingWithAppBarHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AdminSizes.cardRadiusLg),
              color: AdminHelperFunctions.isDarkMode(context)
                  ? AdminColors.black
                  : AdminColors.white,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
