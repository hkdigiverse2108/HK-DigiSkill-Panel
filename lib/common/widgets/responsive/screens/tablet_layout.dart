import 'package:flutter/material.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/headers/header.dart';
import 'package:hkdigiskill_admin/common/widgets/layouts/sidebars/sidebar.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});

  final Widget? body;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: AdminSidebar(),
      appBar: AdminHeader(scaffoldKey: scaffoldKey),
      body: body ?? const SizedBox(),
    );
  }
}
