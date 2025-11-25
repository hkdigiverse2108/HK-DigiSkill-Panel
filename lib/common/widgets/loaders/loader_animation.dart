import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';

class AdminLoadersAnimation extends StatelessWidget {
  const AdminLoadersAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return AdminAnimationLoaderWidget(
      text: "Loading...",
      animation: AdminImages.loadingAnimation,
      height: 300,
      width: 300,
    );
  }
}
