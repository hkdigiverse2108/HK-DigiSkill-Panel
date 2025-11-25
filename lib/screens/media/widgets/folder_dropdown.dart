import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/media/controllers/media_controller.dart';
import 'package:hkdigiskill_admin/utils/constants/enums.dart';

class MediaFolderDropdown extends StatelessWidget {
  const MediaFolderDropdown({super.key, this.onChanged});

  final void Function(MediaCategory?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return Obx(
      () => SizedBox(
        width: 150,
        child: DropdownButtonFormField(
          isExpanded: false,
          initialValue: controller.selectedCategory.value,
          onChanged: onChanged,
          items: MediaCategory.values
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
        ),
      ),
    );
  }
}
