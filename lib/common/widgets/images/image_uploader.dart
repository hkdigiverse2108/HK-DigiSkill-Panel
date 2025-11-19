import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/images/circular_image.dart';
import 'package:hkdigiskill_admin/common/widgets/images/rounded_image.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AdminImageUploader extends StatelessWidget {
  const AdminImageUploader({
    super.key,
    this.circular = false,
    this.image,
    this.onIconButtonPressed,
    required this.imageType,
    this.width = 100,
    this.height = 100,
    this.memoryImage,
    this.icon = Iconsax.edit_2,
    this.top,
    this.bottom = 0,
    this.left = 0,
    this.right,
  });

  final bool circular;

  final String? image;

  final ImageType imageType;

  final double width;

  final double height;

  final Uint8List? memoryImage;

  final IconData icon;

  final double? top;

  final double? bottom;

  final double? left;

  final double? right;

  final VoidCallback? onIconButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        circular
            ? AdminCircularImage(
                image: image,
                width: width,
                height: height,
                imageType: imageType,
                memoryImage: memoryImage,
                backgroundColor: AdminColors.primaryBackground,
              )
            : AdminRoundedImage(
                image: image,
                width: width,
                height: height,
                imageType: imageType,
                memoryImage: memoryImage,
                backgroundColor: AdminColors.primaryBackground,
              ),

        Positioned(
          top: top,
          bottom: bottom,
          left: left,
          right: right,
          child: IconButton(
            onPressed: onIconButtonPressed,
            icon: Icon(icon, size: AdminSizes.md, color: Colors.white),
            style: IconButton.styleFrom(
              backgroundColor: AdminColors.primary.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}
