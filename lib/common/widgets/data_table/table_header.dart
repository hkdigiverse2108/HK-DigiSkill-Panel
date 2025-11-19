import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/routes/routes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

class AdminTableHeader extends StatelessWidget {
  const AdminTableHeader({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.searchController,
    this.onSearchChanged,
  });

  final Function()? onPressed;
  final String buttonText;

  final TextEditingController? searchController;
  final Function(String)? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: AdminDeviceUtility.isDesktopScreen(context) ? 3 : 1,
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: AdminDeviceUtility.isDesktopScreen(context) ? 2 : 1,
          child: TextFormField(
            controller: searchController,
            onChanged: onSearchChanged,
            decoration: const InputDecoration(
              hintText: "Search here...",
              prefixIcon: Icon(Iconsax.search_normal),
            ),
          ),
        ),
      ],
    );
  }
}
