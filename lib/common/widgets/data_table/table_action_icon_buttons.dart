import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class AdminTableActionIconButtons extends StatelessWidget {
  const AdminTableActionIconButtons({
    super.key,
    this.view = false,
    this.edit = false,
    this.delete = false,
    this.onViewPressed,
    this.onEditPressed,
    this.onDeletePressed,
  });

  // Flag to determine if the view button should be displayed
  final bool view;

  // Flag to determine if the edit button should be displayed
  final bool edit;

  // Flag to determine if the delete button should be displayed
  final bool delete;

  final VoidCallback? onViewPressed;
  final VoidCallback? onEditPressed;
  final VoidCallback? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (view)
          IconButton(
            onPressed: onViewPressed,
            icon: const Icon(Iconsax.eye, color: AdminColors.darkerGrey),
          ),
        if (edit)
          IconButton(
            onPressed: onEditPressed,
            icon: const Icon(Iconsax.pen_add, color: AdminColors.primary),
          ),
        if (delete)
          IconButton(
            onPressed: onDeletePressed,
            icon: const Icon(Iconsax.trash, color: AdminColors.error),
          ),
      ],
    );
  }
}
