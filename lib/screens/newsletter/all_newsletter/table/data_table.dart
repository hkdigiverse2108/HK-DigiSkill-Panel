import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkdigiskill_admin/common/widgets/animations/animation_loader.dart';
import 'package:hkdigiskill_admin/common/widgets/data_table/paginated_data_table.dart';
import 'package:hkdigiskill_admin/screens/newsletter/all_newsletter/controllers/newsletter_controller.dart';
import 'package:hkdigiskill_admin/screens/newsletter/all_newsletter/table/table_source.dart';
import 'package:hkdigiskill_admin/utils/constants/image_strings.dart';

class NewsletterTable extends StatelessWidget {
  const NewsletterTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NewsletterController.instance;

    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: AdminAnimationLoaderWidget(
            text: 'Loading Subscribers...',
            animation: AdminImages.loadingAnimation,
            height: 200,
            width: 200,
          ),
        );
      }

      return AdminPaginatedDataTable(
        tableHeight: 600,
        minWidth: 600,
        sortAscending: controller.sortAscending.value,
        sortColumnIndex: controller.sortColumnIndex.value,
        source: NewsletterTableSource(),
        columns: [
          DataColumn2(
            label: const Text("Email"),
            onSort: (i, asc) => controller.sort(i, asc),
          ),
          DataColumn2(
            label: const Text("Subscribed On"),
            onSort: (i, asc) => controller.sort(i, asc),
          ),
          const DataColumn2(label: Text("Actions"), fixedWidth: 120),
        ],
      );
    });
  }
}
