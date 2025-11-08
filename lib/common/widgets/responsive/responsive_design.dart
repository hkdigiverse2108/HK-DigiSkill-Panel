import 'package:flutter/material.dart';

class AdminResponsiveDesign extends StatelessWidget {
  const AdminResponsiveDesign({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  });

  /// widget for mobile layout
  final Widget mobile;

  /// widget for tablet layout
  final Widget tablet;

  /// widget for desktop layout
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1366) {
          return desktop;
        } else if (constraints.maxWidth < 1366 && constraints.maxWidth >= 768) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
