import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/headers/header.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/sidebars/sidebar.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: AdminSidebar()),
          // Gap(20),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // header
                AdminHeader(),

                body ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
