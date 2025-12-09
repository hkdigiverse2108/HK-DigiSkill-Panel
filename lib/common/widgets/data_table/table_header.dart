import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/utils/constants/sizes.dart';
import 'package:hkdigiskill_admin/utils/device/device_utility.dart';
import 'package:hkdigiskill_admin/utils/helpers/helpers.dart';
import 'package:iconsax/iconsax.dart';

class AdminTableHeader extends StatelessWidget {
  const AdminTableHeader({
    super.key,
    this.onPressed,
    required this.buttonText,
    this.isButtonVisible = true,
    this.searchController,
    this.onSearchChanged,
  });

  final Function()? onPressed;
  final String buttonText;

  final bool isButtonVisible;

  final TextEditingController? searchController;
  final Function(String)? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return AdminHelperFunctions.isWidthValid(500)
        ? Column(
            children: [
              if (isButtonVisible)
                ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
              const SizedBox(height: AdminSizes.spaceBtwItems),
              SizedBox(
                width: AdminDeviceUtility.isDesktopScreen(context)
                    ? 300
                    : double.infinity,
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
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: AdminDeviceUtility.isDesktopScreen(context) ? 3 : 1,
                child: Row(
                  children: [
                    if (isButtonVisible)
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: onPressed,
                          child: Text(
                            buttonText,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
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
