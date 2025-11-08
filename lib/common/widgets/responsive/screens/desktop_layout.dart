import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Drawer(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
          ),
          // Gap(20),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // header
                Container(
                  height: 75,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xff1d1b20)),
                ),

                body ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
